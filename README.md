# 🚗 RentACar Projesi

ASP.NET Framework 4.8 ile geliştirilmiş araç kiralama uygulaması.  

## ⚙️ Bağlantı Ayarı
`Web.config` dosyası:
```xml
<connectionStrings>
  <add name="DefaultConnection"
       connectionString="Data Source=(LocalDb)\MSSQLLocalDB;Initial Catalog=RentACar;Integrated Security=True"
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

## 📄 Sayfalar
- Account/Login.aspx → Giriş
- Account/Register.aspx → Kayıt
- ReqCollection.aspx → Talep oluşturma
- ListCollection.aspx → Talepleri listeleme

## 🧱 Migration Komutları
```powershell
Enable-Migrations
Add-Migration mig_0 (mig_0 yerine herhangi bir şey yazabilirsiniz)
Update-Database
```

## 🚀 Çalıştırma
1. Visual Studio’da projeyi aç.  
2. `RentACar`'ı **Startup Project** yap.  
3. `Ctrl + F5` ile başlat.  
4. Veritabanı otomatik oluşur (`RentACar`).  
5. Başlangıç sayfası: `/Account/Login.aspx`
