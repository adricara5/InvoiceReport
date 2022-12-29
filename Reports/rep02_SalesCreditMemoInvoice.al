report 50102 "Mek Sales Credit Memo Invoice"
{
    Caption = 'Sales Credit Memo Invoice';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SalesCreditMemoInvoice.rdl';

    dataset
    {
        dataitem(CompanyInformation; "Company Information")
        {
            column(LOGO; Picture)
            {
                IncludeCaption = true;
            }
            column(SHITESI; Name)
            {
                IncludeCaption = true;
            }
            column(NIPT; "VAT Registration No.")
            {
                IncludeCaption = true;
            }
            column(ADRESA1; Address)
            {
                IncludeCaption = true;
            }
            column(TEL; "Phone No.")
            {
                IncludeCaption = true;
            }
        }

        dataitem(SalesCrMemoHeader; "Sales Cr.Memo Header")
        {
            DataItemTableView = sorting("No.");
            column(DATA; "Posting Date")
            {
                IncludeCaption = true;
            }
            column(NR_i_FATURES; "No.")
            {
                IncludeCaption = true;
            }
            column(NR_SERIAL; "No.")
            {
                IncludeCaption = true;
            }
            column(BLERESI; "Sell-to Customer Name")
            {
                IncludeCaption = true;
            }
            column(ADRESA2; "Bill-to Address")
            {
                IncludeCaption = true;
            }
            column(NIPT2; "VAT Registration No.")
            {
                IncludeCaption = true;
            }
            /*
            column(ORA_E_FURNIZIMIT; "Ora e furnizimit")
            {
                IncludeCaption = true;
            }
            column(NIVF; SMW_NIVF)
            {
                IncludeCaption = true;
            }
            column(NSLF; "NSLF(IIC)")
            {
                IncludeCaption = true;
            }
            */
            column(Metoda_e_Pageses; "Payment Method Code")
            {
                IncludeCaption = true;
            }
            column(Afati_I_pageses; "Due Date")
            {
                IncludeCaption = true;
            }
            /*
            column(Totali_Lek; "Total excl.VAT(ALL)")
            {
                IncludeCaption = true;
            }
            column(Totali_Eur; "Total excl.VAT(EUR)")
            {
                IncludeCaption = true;
            }
            column(Nga_te_cilat_Furnizime_te_tatueshme; "Totali Lek")
            {
                IncludeCaption = true;
            }
            */
            column(Kursi; "Currency Code")
            {

            }

            dataitem(SalesCrMemoLine; "Sales Cr.Memo Line")
            {
                DataItemLink = "No." = field("No.");
                column(Kodi; "No.")
                {
                    IncludeCaption = true;
                }
                column(Pershkrimi_i_mallit; Description)
                {
                    IncludeCaption = true;
                }
                column(Njesi; "Unit of measure")
                {
                    IncludeCaption = true;
                }
                column(Sasia; "Quantity")
                {
                    IncludeCaption = true;
                }
                column(Cmimi_pa_TVSH; AmountExclVAT)
                {

                }
                column(Vlefta_pa_TVSH; Amount)
                {
                    IncludeCaption = true;
                }
                column(Vlefta_e_TVSH; VATamount)
                {

                }
                column(Vlefta_me_TVSH; "Amount Including VAT")
                {
                    IncludeCaption = true;
                }
                column(Zbritje; "Line Discount %")
                {
                    IncludeCaption = true;
                }

                trigger OnAfterGetRecord();
                var
                begin
                    AmountExclVAT := Amount / Quantity;
                    VATamount := "VAT %" * AmountExclVAT;
                end;
            }

            dataitem(Customer; Customer)
            {
                DataItemLink = "Phone No." = field("Sell-to Customer Name");
                column(TEL2; "Phone No.")
                {
                    IncludeCaption = true;
                }
            }
            dataitem(ShippingAgent; "Shipping Agent")
            {
                //DataItemLink = "Name" = field(Nipt);
                column(TRANSPORTUESI; Name)
                {
                    IncludeCaption = true;
                }
                column(ADRESA3; "Shipping Agent Address")
                {
                    IncludeCaption = true;
                }
                /*          
                column(NIPT3; Nipt)
                {
                    IncludeCaption = true;
                }
                */
                column(TARGA_E_MJETIT; "Vehicle Plate No.")
                {
                    IncludeCaption = true;
                }
            }

            /*            
            trigger OnAfterGetRecord();
            begin
                "No." := '';
                if "Currency Code"::LEK then begin

                end;
            end;
            */
        }

        dataitem(FiscalUser; "Fiscal User")
        {
            column(Vendi_I_ushtrimit_te_biznesit; "Business Unit Code")
            {
                IncludeCaption = true;
            }
            column(Operatori; "Operator Code")
            {
                IncludeCaption = true;
            }
        }
    }

    labels
    {
        MektrinSalesCreditMemoInvoice = 'FATURE TATIMORE SHITJE';
    }

    var
        AmountExclVAT: Decimal;
        VATamount: Decimal;
}