import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/tasklist.dart';

class TaskData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<TasklistModel>> loadTasks() async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) return [];

      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .get();

      return snapshot.docs.map((doc) {
        return TasklistModel.fromJson(doc.data(), id: doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }

  Future<void> addTask({
    required String title,
    required DateTime day,
    required TimeOfDay time,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    await _firestore.collection('users').doc(userId).collection('tasks').add({
      'title': title,
      'day': day.toIso8601String(),
      'timeHour': time.hour,
      'timeMinute': time.minute,
    });
  }

  Future<void> updateTask({
    required String taskId,
    required String title,
    required DateTime day,
    required TimeOfDay time,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .update({
          'title': title,
          'day': day.toIso8601String(),
          'timeHour': time.hour,
          'timeMinute': time.minute,
        });
  }

  Future<void> deleteTask(String taskId) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }
}