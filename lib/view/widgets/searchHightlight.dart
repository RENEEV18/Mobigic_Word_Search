// ignore: file_names

import 'dart:developer';

List searchLogicList(List twoDList, String word, int r, int c) {
  List ind = [];
  int flag = 0;
  int wlen = word.length;
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      if (twoDList[i][j] == word[0]) {
        if (r - wlen >= i) {
          int inc = 0;
          int k;
          for (k = i; k < i + wlen; k++) {
            if (twoDList[k][j] == word[inc]) {
              flag = 1;
              inc++;
            } else {
              flag = 0;
              break;
            }
          }
          if (flag == 1) {
            log("present");
            for (int l = i; l < k; l++) {
              log("Yo");
              ind.add((j * r) + l);
            }
            log(ind.toString());
          } else {
            log("Not present");
          }
        }
        if (c - wlen >= j) {
          int inc = 0;
          int k;
          for (k = j; k < j + wlen; k++) {
            if (twoDList[i][k] == word[inc]) {
              flag = 1;
              inc++;
            } else {
              flag = 0;
              break;
            }
          }
          if (flag == 1) {
            log("present");
            for (int l = j; l < k; l++) {
              ind.add((l * r) + i);
            }
            log(ind.toString());
          } else {
            log("Not present");
          }
        }

        if (c - wlen >= j && r - wlen >= i) {
          int inc = 0;
          int k;
          int m = i;
          for (k = j; k < j + wlen && m < i + wlen; k++) {
            if (twoDList[m][k] == word[inc]) {
              flag = 1;
              inc++;
            } else {
              flag = 0;
              break;
            }
            m++;
          }
          if (flag == 1) {
            log("present");
            int cnt = 0;
            for (int l = j; l < k; l++) {
              ind.add(((l * r) + i) + cnt);
              cnt++;
            }
            log(ind.toString());
          } else {
            log("Not present");
          }
        }
      }
    }
  }
  return ind;
}
