﻿using HotelBilling.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace HotelBilling.View
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class BasePage : ContentPage
    {
        public BasePage()
        {
            InitializeComponent();
        }
    }
}