4gpi-utils
==========

4GPi を操作するためのツール類を提供します。

## 提供ファイル
次のファイルがパッケージに含まれています。

### /etc/default/4gpi
4GPi の動作設定を行うためのファイルです。  
設定可能な項目を次に示します。

+ CONSOLE_PORT  
  4GPi で AT コマンドを実行する際に使用するポートを設定します。  
  デフォルトは /dev/tty4GPI です。

+ RI_PIN  
  4GPi の着信通知に使用する GPIO のピン番号を指定します。  
  4GPi 基板上のジャンパピンで GPIO16 と GPIO18 を選択できます。  
  空白の場合は無効になります。  
  デフォルトは無効です。

+ POWER_PIN  
  4GPi の電源操作に使用する GPIO のピン番号を指定します。  
  4GPi 基板上のジャンパピンで GPIO17 と GPIO12 を選択できます。  
  空白の場合は無効になります。  
  デフォルトは 17 です。

+ STATUS_PIN  
  4GPi の電源状態取得に使用する GPIO のピン番号を指定します。  
  4GPi 基板上のジャンパピンで GPIO22 と GPIO13 を選択できます。  
  空白の場合は無効になります。  
  デフォルトは 22 です。

+ RESET_PIN  
  4GPi のリセット操作に使用する GPIO のピン番号を指定します。  
  4GPi 基板上のジャンパピンで GPIO27 と GPIO6 を選択できます。  
  空白の場合は無効になります。  
  デフォルトは 27 です。

+ AUTO_ON  
  Raspberry Pi ブート時の 4GPi の動作を設定します。  
  デフォルトは 1 です。

  1 : 4GPi の通信モジュールの電源をオンにします。  
  0 : 4GPi の操作は行いません。

+ AUTO_OFF  
  Raspberry Pi シャットダウン時の 4GPi の動作を設定します。  
  デフォルトは 1 です。

  1 : 4GPi の通信モジュールの電源をオフにします。  
  0 : 4GPi の操作は行いません。

+ WAKE_ON_RING  
  待機中に着信があった場合 RI 信号を出力します。  
  有効にするには AUTO_OFF=0 である必要があります。  
  デフォルトは 0 です。

+ STORE_SMS_ON_RING  
  待機中に SMS の着信があった場合に本文を通信モジュールに保存します。  
  有効にするには WAKE_ON_RING=1 である必要があります。  
  デフォルトは 0 です。  
  **SORACOM グローバル向け Air SIM を使用する場合は 0 に設定してください。**

### /usr/sbin/4gpictl
4GPi の操作を行うための実行ファイルです。  
使用可能なパラメータを次に示します。
+ poweron  
  電源をオンします。  
+ poweroff  
  電源をオフします。  
+ reset  
  電源をリセットします。  
+ status  
  電源状態を表示します。  
+ store-sms {enable|disable}  
  SMS の保存を設定します。  
+ wake-on-ring {enable|disable}  
  Wake-on-Ring を設定します。  
+ version  
  バージョンを表示します。  
+ help  
  ヘルプを表示します。

指定可能なオプションを次に示します。
+ -c, --config _&lt;FILE&gt;_  
  _&lt;FILE&gt;_ から設定を読み込みます。  
  デフォルトは /etc/default/4gpi です。
+ -t, --timeout _&lt;N&gt;_  
  コマンドの実行を _&lt;N&gt;_ 秒後にタイムアウトします。  
  デフォルトは 40 です。  
+ -h, --hard  
  ハードウェアによる poweroff または reset を行います。  
+ -s, --soft  
  ソフトウェアによる poweroff または reset を行います。  
  デフォルトではソフトウェアによる操作を行います。

### /usr/lib/4gpi-utils/device-start.sh
4GPi の起動処理を行う実行ファイルです。

### /usr/lib/4gpi-utils/device-stop.sh
4GPi の終了処理を行う実行ファイルです。

### /usr/lib/4gpi-utils/modem-config.sh
4GPi のモデムの設定を行う実行ファイルです。

### /lib/udev/rules.d/70-4gpi-port.rules
4GPi のデバイスを定義した設定ファイルです。

### /lib/systemd/system/4gpi-modem-config.service
4GPi のモデムの設定を行うサービスの設定ファイルです。

### /lib/systemd/system/4gpi-setup.service
4GPi の起動終了処理を行うサービスの設定ファイルです。

### /usr/share/bash-completion/completions/4gpictl
4gpictl のコマンド補完を行うための設定ファイルです。

### /usr/share/doc/4gpi-utils/changelog.gz
パッケージの変更履歴を記録したファイルです。

### /usr/share/doc/4gpi-utils/copyright
著作権とライセンスを記載したファイルです。
