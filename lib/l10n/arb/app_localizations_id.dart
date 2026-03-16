// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get active => 'Aktif';

  @override
  String get activeCashierConfirmation =>
      'Apakah ingin menyelesaikan terlebih dahulu atau tetap melanjutkan?';

  @override
  String get accessCashierConfirmationTitle => 'Konfirmasi Akses Mesin Kasir';

  @override
  String get accessNewCashierWarning =>
      'Saat ini Anda mencoba mengakses mesin kasir dari perangkat baru. Untuk melanjutkan, Anda memerlukan kode akses dari Admin atau Manager Anda.';

  @override
  String get activate => 'Aktifkan';

  @override
  String get all => 'Semua';

  @override
  String get allowManualSearch => 'Izinkan Pencarian Manual dengan Ketik';

  @override
  String get allowManualSearchInstruction =>
      'Aktifkan dengan PIN Store Manager untuk membolehkan kasir mengetik produk secara manual (berlaku sampai sesi kasir ditutup).';

  @override
  String get and => 'dan';

  @override
  String get apply => 'Terapkan';

  @override
  String get applyDiscount => 'Terapkan Diskon';

  @override
  String get appliedDiscount => 'Diskon Terpasang';

  @override
  String get authorization => 'Otorisasi';

  @override
  String get authorizeHppPermissionTitle => 'Izin ubah harga dibawah HPP';

  @override
  String get available => 'Tersedia';

  @override
  String get availablePoints => 'Poin tersedia';

  @override
  String get back => 'Kembali';

  @override
  String get balance => 'Saldo';

  @override
  String becauseBenefitX(String benefitX) {
    return 'karena benefit $benefitX';
  }

  @override
  String get birthDay => 'Tanggal Lahir';

  @override
  String get cancel => 'Batal';

  @override
  String get cashierOpening => 'Membuka kasir';

  @override
  String get change => 'Ubah';

  @override
  String get close => 'Tutup';

  @override
  String get confirmAccess => 'Konfirmasi Akses';

  @override
  String get continueLabel => 'Lanjutkan';

  @override
  String get currentBenefit => 'Benefit Saat Ini';

  @override
  String get customer => 'Pelanggan';

  @override
  String get customerAlreadyMaxTier => 'Pelanggan sudah menjadi tier tertinggi';

  @override
  String get customerName => 'Nama Pelanggan';

  @override
  String get customerPhone => 'No. Telepon Pelanggan';

  @override
  String get customerProfile => 'Profil Pelanggan';

  @override
  String get daftarRegister => 'Daftar Register';

  @override
  String get deactivate => 'Nonaktifkan';

  @override
  String get delete => 'Hapus';

  @override
  String get deviceCodeEmpty => 'Harap masukkan Kode Perangkat';

  @override
  String get deviceCodeMinLength => 'Minimal kode perangkat 6 digit';

  @override
  String get discountFromPoints => 'Diskon dari Poin';

  @override
  String discountFromX(String pointLabel) {
    return 'Diskon dari \$$pointLabel';
  }

  @override
  String get dontHaveAccount => 'Belum punya akun?';

  @override
  String get email => 'Email';

  @override
  String get errorFetchListRegister =>
      'Terjadi kesalahan saat pengambilan daftar outlet';

  @override
  String get estimatedSave => 'Estimasi Hemat';

  @override
  String expiredOnX(String dateX) {
    return 'kedaluwarsa pada $dateX';
  }

  @override
  String get forgetPassword => 'Lupa password ?';

  @override
  String get help => 'Bantuan';

  @override
  String get initialCash => 'Kas Awal';

  @override
  String get inputCashDenomination => 'Masukkan pecahan uang tunai';

  @override
  String get inputCashNominal => 'Masukkan nominal uang';

  @override
  String get inputCode => 'Masukkan Kode';

  @override
  String get inputEmail => 'Masukkan email';

  @override
  String get inputPassword => 'Masukkan password';

  @override
  String get inputPointAmount => 'Masukkan jumlah poin';

  @override
  String inputXPointAmount(String pointLabel) {
    return 'Masukkan jumlah $pointLabel';
  }

  @override
  String get itemCode => 'Kode Barang';

  @override
  String get itemName => 'Nama Barang';

  @override
  String get lastActivity => 'Aktivitas Terakhir';

  @override
  String get login => 'Masuk';

  @override
  String get loginInstruction =>
      'Masukkan email dan password untuk masuk ke Jubelio POS';

  @override
  String get loginToJubelio => 'Masuk ke akun Jubelio';

  @override
  String get loyaltyAndTier => 'Loyalty Programs & Tier';

  @override
  String maxXRedeemablePointIs(Object pointLabel) {
    return 'Maksimum Penggunaan $pointLabel:';
  }

  @override
  String maxXRedeemablePointIsY(String pointLabel, String pointY) {
    return 'Maksimum Penggunaan $pointLabel: $pointY';
  }

  @override
  String get memberSince => 'Member Sejak';

  @override
  String needXPointToY(String pointX, String pointLabel, String tierY) {
    return 'Butuh $pointX $pointLabel lagi untuk ke $tierY';
  }

  @override
  String get neverOpened => 'Belum pernah dibuka';

  @override
  String get no => 'Tidak';

  @override
  String get noBenefitAvailable => 'Tidak ada benefit tersedia';

  @override
  String get noInternetConnection => 'Tidak ada koneksi internet';

  @override
  String get noCashierYet => 'Belum Ada Kasir';

  @override
  String get noCashierAvailableAtTheLocation =>
      'Belum ada kasir yang tersedia di lokasi ini';

  @override
  String get ok => 'Oke';

  @override
  String get onboardingDesc1 =>
      'BOPIS (Buy Online Pickup in Store) pembelian online yang dapat diambil langsung ke toko. BORIS (Buy Online Return in Store) retur langsung di toko.';

  @override
  String get onboardingDesc2 =>
      'Fitur promosi dan diskon untuk salah satu item atau transaksi. Serta dengan buku harga anda bisa menjual produk dengan harga yang berbeda.';

  @override
  String get onboardingDesc3 =>
      'Pengembalian barang atau pembatalan pembelian sebelumnya. Retur memiliki opsi untuk refund tunai atau disimpan di store credit.';

  @override
  String get onboardingTitle1 => 'BOPIS dan BORIS';

  @override
  String get onboardingTitle2 => 'Promosi, Harga Coret, dan Buku Harga';

  @override
  String get onboardingTitle3 => 'Proses Retur dan Refund';

  @override
  String get openCashier => 'Buka Kasir';

  @override
  String get outletNotIntegrated => 'Jubelio POS belum terintegrasi';

  @override
  String get outletNotFound => 'Outlet tidak ditemukan';

  @override
  String get password => 'Password';

  @override
  String get pickDate => 'Pilih Tanggal';

  @override
  String get phoneNumberShort => 'No. Telepon';

  @override
  String get pleaseCallManagerToGetAccessCode =>
      'Harap hubungi akun manager anda untuk memberikan akses penjualan.';

  @override
  String get point => 'Poin';

  @override
  String pointExpired(String pointLabel) {
    return '$pointLabel Akan Kedaluwarsa';
  }

  @override
  String pointNow(String pointLabel) {
    return '$pointLabel Saat Ini';
  }

  @override
  String pointXAvailable(String pointLabel) {
    return '$pointLabel tersedia';
  }

  @override
  String get printLastClosureReceipt => 'Cetak Struk Penutupan Kasir';

  @override
  String get redeem => 'Tukarkan';

  @override
  String get redeemAll => 'Tukarkan Semua';

  @override
  String get register => 'Register';

  @override
  String get registerLocation => 'Lokasi Register';

  @override
  String get reset => 'Reset';

  @override
  String get returnNumberShort => 'No. Retur';

  @override
  String get save => 'Simpan';

  @override
  String get scan => 'Scan';

  @override
  String get scanBarcode => 'Scan Barcode';

  @override
  String get search => 'Cari';

  @override
  String get searchItem => 'Cari Barang';

  @override
  String get searchLocation => 'Cari Lokasi';

  @override
  String get searchResultNotFound => 'Hasil tidak ditemukan';

  @override
  String get selectBirthday => 'Pilih Tanggal Lahir';

  @override
  String get selectCustomer => 'Pilih Pelanggan';

  @override
  String get setAsPriceChecker => 'Jadikan Price Checker';

  @override
  String get stillActiveCashier => 'Masih ada Kasir yang aktif.';

  @override
  String get thisTransactionAutomaticallyGet =>
      'Transaksi ini otomatis mendapatkan';

  @override
  String get tierProgress => 'Progres Tier';

  @override
  String get totalConverted => 'Total Konversi';

  @override
  String get transaction => 'Transaksi';

  @override
  String get transactionNumberShort => 'No. Transaksi';

  @override
  String get transactionSearch => 'Pencarian Transaksi';

  @override
  String get transactionNotPaid => 'Belum Lunas';

  @override
  String get transactionNotSync => 'Belum Sync';

  @override
  String get transactionQRISNotPaid => 'Belum Lunas (QRIS)';

  @override
  String get turnOnInternetToContinue =>
      'Harap mengaktifkan koneksi internet anda untuk melanjutkan';

  @override
  String get unlimited => 'Tidak Terbatas';

  @override
  String get useAll => 'Gunakan Semua';

  @override
  String get useLoyaltyPoints => 'Gunakan Poin Loyalty';

  @override
  String useLoyaltyXPointY(String pointLabel, String loyaltyName) {
    return 'Gunakan $pointLabel $loyaltyName';
  }

  @override
  String get warning => 'Perhatian';

  @override
  String get warningPriceBelowHpp =>
      'Harga jual tidak boleh lebih rendah dari HPP sesuai pengaturan toko.';

  @override
  String get warningPriceBelowHppConfirmation =>
      'Harga yang Anda masukkan di bawah HPP. Apakah Anda yakin ingin melanjutkan?';

  @override
  String get welcome => 'Selamat datang';

  @override
  String willExpiredOnX(String dateX) {
    return 'akan kedaluwarsa pada $dateX';
  }

  @override
  String xAvailable(String name) {
    return '$name Tersedia';
  }

  @override
  String xYAvailableZ(int point, String pointName, String pointZ) {
    return '$point $pointName tersedia, 1 $pointName = $pointZ';
  }

  @override
  String xToY(String X, String Y) {
    return '$X ke $Y';
  }

  @override
  String get yes => 'Ya';

  @override
  String get yesContinue => 'Ya, Lanjutkan';
}
