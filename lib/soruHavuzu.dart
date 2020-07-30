import 'package:flutter/material.dart';

import 'soru.dart';

class SoruHavuzu {
  int _soruIndex = 0;

  List<Soru> _soruBankasi = [
    Soru(
        soruText: "Barcelona İspanya'nın başkentidir.",
        soruCevap: false,
        soruIndex: "1.Soru"),
    Soru(
        soruText: "Her doğal sayı tamsayıdır.",
        soruCevap: true,
        soruIndex: "2.Soru"),
    Soru(
        soruText: "Kanada'nın başkenti Toronto'dur.",
        soruCevap: false,
        soruIndex: "3.Soru"),
    Soru(
        soruText: "Türkiye Birleşmiş Milletler üyesidir.",
        soruCevap: true,
        soruIndex: "4.Soru"),
    Soru(
        soruText: "12 Eylül darbesi 1982 yılında gerçekleşmiştir.",
        soruCevap: false,
        soruIndex: "5.Soru"),
    Soru(
        soruText: "Bütün rakamların çarpımı 0'dır.",
        soruCevap: true,
        soruIndex: "6.Soru"),
    Soru(
        soruText: "Trakya 3 heceli bir kelimedir.",
        soruCevap: false,
        soruIndex: "7.Soru"),
    Soru(
        soruText: "TDK'ya göre 'ön yargı/önyargı' ayrı yazılır.",
        soruCevap: true,
        soruIndex: "8.Soru"),
    Soru(
        soruText: "Kelvin bir sıcaklık birimidir.",
        soruCevap: true,
        soruIndex: "9.Soru"),
    Soru(
        soruText: "Kükürt oda koşullarında gazdır.",
        soruCevap: false,
        soruIndex: "10.Soru"),
  ];

  String soruTextGetir() {
    return _soruBankasi[_soruIndex].soruText;
  }

  bool soruCevapGetir() {
    return _soruBankasi[_soruIndex].soruCevap;
  }

  void sonrakiSoruGetir() {
    if (_soruIndex < _soruBankasi.length - 1) {
      _soruIndex++;
    }
  }

  String soruIndexGetir() {
    return _soruBankasi[_soruIndex].soruIndex;
  }

  bool sorularBittiMi() {
    if (_soruIndex >= _soruBankasi.length - 1) {
      return true;
    } else
      return false;
  }

  void reset() {
    _soruIndex = 0;
  }
}
