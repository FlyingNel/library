using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace library.frames
{
    /// <summary>
    /// Логика взаимодействия для Book.xaml
    /// </summary>
    public partial class Book : Page
    {
        private List<Books> allbook;
        public Book()
        {
            InitializeComponent();
            allbook = DbConnect.prObj.Books.ToList();
        }

        private void BookSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (BookSort.SelectedIndex == 0)
            {
                List<Books> sortMaterials = allbook.OrderBy(x => x.Name).ToList();
                BookList.ItemsSource = sortMaterials;
            }
            else if (BookSort.SelectedIndex == 1)
            {
                List<Books> sortMaterials = allbook.OrderByDescending(x => x.Author).ToList();
                BookList.ItemsSource = sortMaterials;
            }
            else if (BookSort.SelectedIndex == 2)
            {
                List<Books> sortMaterials = allbook.OrderByDescending(x => x.Date).ToList();
                BookList.ItemsSource = sortMaterials;
            }
        }

        private void TxbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                BookList.ItemsSource = DbConnect.prObj.Books.Where(x => x.Name.Contains(TxbSearch.Text)).Take(15).ToList();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new AddRequest());
        }
    }
}
