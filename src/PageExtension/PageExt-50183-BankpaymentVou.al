pageextension 50183 Bank_Payment_Voucher_Report extends "Bank Payment Voucher"
{
    // version NAVIN7.10\\pcpl0024_FILE GEN

    layout
    {

    }
    actions
    {
        addafter("Print Check")
        {
            action("<Action50>")
            {
                Image = "PrintCheck";
                Caption = 'Check printing';
                ApplicationArea = ALl;

                trigger OnAction();
                begin
                    GenJournalLine.RESET;
                    GenJournalLine.SETRANGE("Document No.", Rec."Document No.");
                    IF GenJournalLine.FINDFIRST THEN
                        REPORT.RUNMODAL(50011, TRUE, FALSE, GenJournalLine);
                end;
            }
            action("Purchase Order- FA")
            {
                Caption = 'PO-FA';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50041; //NSW07
                ApplicationArea = all;
            }
            action("Purchase Order- RMPM")
            {
                Caption = 'PO-RMPM';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50035; //NSW07
                ApplicationArea = all;
            }
        }
        modify(Preview)
        {
            Visible = true;
        }
    }


    var
        GenJournalLine: Record 81;
        recVendor: Record 23;



}

