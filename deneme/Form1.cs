using deneme.Entity;
using System;
using System.Linq;
using System.Windows.Forms;

namespace deneme
{
    public partial class Form1 : Form
    {
        KIRALAMAEntities1 DB = new KIRALAMAEntities1();

        // Seçili araç (AKod), müşteri (MKod) ve kiralama kaydı (KKod)
        int AKOD, MKOD, KKOD;

        public Form1()
        {
            InitializeComponent();
        }

        private void mgetir()
        {
            dgvUyeler.DataSource = DB.sp_Mgetir().ToList();
        }

        private void agetir()
        {
            dgvKitaplar.DataSource = DB.sp_Agetir().ToList();
        }

        private void Islemlistele()
        {
            dgvIslem.DataSource = DB.sp_Kirala().ToList();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                agetir();
                mgetir();
                Islemlistele();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Veritabanına bağlanılamadı. App.config içindeki bağlantı cümlesini kontrol edin.\n\n" + ex.Message,
                    "Bağlantı Hatası", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // Satırdaki bir hücrenin değerini int olarak okur (başlık satırı ve boş hücreler için 0 döner)
        private static int HucreDegeri(DataGridView dgv, int satir, string kolon)
        {
            if (satir < 0 || !dgv.Columns.Contains(kolon)) return 0;
            var deger = dgv.Rows[satir].Cells[kolon].Value;
            return deger == null || deger == DBNull.Value ? 0 : Convert.ToInt32(deger);
        }

        // Müşteri seç
        private void dgvUyeler_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex < 0) return;
            MKOD = HucreDegeri(dgvUyeler, e.RowIndex, "MKod");
        }

        // Araç seç
        private void dgvKitaplar_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex < 0) return;
            AKOD = HucreDegeri(dgvKitaplar, e.RowIndex, "AKod");
        }

        // Kiralama kaydı seç: teslim alma için kayıt, araç ve müşteri kodları bu satırdan alınır
        private void dgvIslem_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex < 0) return;
            KKOD = HucreDegeri(dgvIslem, e.RowIndex, "KKod");
            AKOD = HucreDegeri(dgvIslem, e.RowIndex, "AKod");
            MKOD = HucreDegeri(dgvIslem, e.RowIndex, "MKod");
        }

        // Kirala: seçili aracı seçili müşteriye teslim eder (spAracTeslimEt)
        private void btnOduncVer_Click(object sender, EventArgs e)
        {
            if (AKOD == 0 || MKOD == 0)
            {
                MessageBox.Show("Kiralamak için önce bir müşteri ve bir araç seçin.", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var arac = DB.ARAC.Find(AKOD);
            if (arac != null && arac.Kirada == true)
            {
                MessageBox.Show("Bu araç şu anda kirada.", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            DB.spAracTeslimEt(AKOD, MKOD);
            MessageBox.Show("Araç kiralandı.");
            Yenile();
        }

        // Teslim Al: seçili kiralama kaydını kapatır, aracı boşa çıkarır (spAracTeslimAl)
        private void btnGeriAl_Click(object sender, EventArgs e)
        {
            if (KKOD == 0)
            {
                MessageBox.Show("Teslim almak için alttaki listeden bir kiralama kaydı seçin.", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var kira = DB.KIRA.Find(KKOD);
            if (kira != null && kira.TeslimTarih != null)
            {
                MessageBox.Show("Bu araç zaten teslim alınmış.", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            DB.spAracTeslimAl(KKOD, AKOD, MKOD);
            MessageBox.Show("Araç teslim alındı.");
            Yenile();
        }

        private void Yenile()
        {
            AKOD = MKOD = KKOD = 0;
            // Stored procedure'ler veriyi doğrudan değiştirdiği için EF önbelleğini tazele
            DB.Dispose();
            DB = new KIRALAMAEntities1();
            agetir();
            mgetir();
            Islemlistele();
        }

        private void txtUyeAra_TextChanged(object sender, EventArgs e)
        {
            dgvUyeler.DataSource = DB.spTCFiltre(txtUyeAra.Text).ToList();
        }

        private void txtKitapAra_TextChanged(object sender, EventArgs e)
        {
            dgvKitaplar.DataSource = DB.spPlakaFiltre(txtKitapAra.Text).ToList();
        }

        private void BtnCikis_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
