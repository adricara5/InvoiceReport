report 50101 "Mektrin Sales Invoice"
{
    Caption = 'Sales Invoice';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SalesInvoice.rdl';

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

        dataitem(PostedSalesInvoice; "Sales Invoice Header")
        {
            column(DATA; "Posting Date")
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
            column(NR_i_FATURES; "Document No. Fiscal")
            {
                IncludeCaption = true;
            }
            column(NR_SERIAL; "Document No. Fiscal")
            {
                IncludeCaption = true;
            }
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


            dataitem(SalesInvoiceLine; "Sales Invoice Line")
            {
                //DataItemLink = "No." = field("Document No. Fiscal");
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
                column(Cmimi_pa_TVSH; Price)
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
                column(TotalVleftaPaTVSH; TotalVleftaPaTVSH)
                {

                }
                column(TotalVleftaeTVSH; TotalVleftaeTVSH)
                {

                }
                column(TotalVleftaMeTVSH; TotalVleftaMeTVSH)
                {

                }

                trigger OnAfterGetRecord();
                var
                begin
                    if Quantity <> 0 then
                        Price := Amount / Quantity
                    else
                        Price := Amount;
                    VATamount := "Amount Including VAT" - Amount;
                    TotalVleftaPaTVSH := TotalVleftaPaTVSH + Amount;
                    TotalVleftaeTVSH := TotalVleftaeTVSH + VATamount;
                    TotalVleftaMeTVSH := TotalVleftaMeTVSH + "Amount Including VAT";
                end;
            }

            dataitem(Customer; Customer)
            {
                DataItemLink = "Phone No." = field("Sell-to Customer No.");
                column(TEL2; "Phone No.")
                {
                    IncludeCaption = true;
                }
            }
            dataitem(ShippingAgent; "Shipping Agent")
            {
                DataItemLink = "Name" = field("VAT Registration No.");
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
        MektrinSalesInvoice = 'FATURE TATIMORE SHITJE';
    }

    var

        Price: Decimal;
        VATamount: Decimal;
        TotalVleftaPaTVSH: Decimal;
        TotalVleftaeTVSH: Decimal;
        TotalVleftaMeTVSH: Decimal;
}