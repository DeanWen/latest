﻿<!-- Copyright by Indiana University Purdue University Indianapolis
  -- School of Computer & Informatic Science
  -- Dian Wen & Rui Wang
  -- 2013 Jan-May
-->

<%@ Page Title="Student" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Student.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="SearchMsg" CssClass="form lable" runat="server">Search by: </asp:Label>
    <asp:DropDownList ID="SearchArea"  runat="server">
        <asp:ListItem Value="SID">StudentID</asp:ListItem>
        <asp:ListItem Value="PID">ProjectID</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="SearchTxt" OnTextChanged="getStudent" runat="server"></asp:TextBox>
    <asp:Button ID="search" class="button"  Visible="true" Text="Search" runat="server" onclick="getStudent" />
    <asp:RegularExpressionValidator ID="checkuname" runat="server" ErrorMessage="Incorrect, must be between 1-10 bits numbers ." ControlToValidate="SearchTxt" ValidationExpression="[0-9]{1,10}" />

    <asp:Panel ID="PnlTable" runat="server">
       <asp:GridView ID="StudentGrid" runat="server" AutoGenerateEditButton="true" 
           AllowSorting="True" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" 
            ShowFooter="True" PageSize="20"
           OnPageIndexChanging="PageIndexChanging" AllowPaging="True" PagerSettings-PageButtonCount="10" 
           OnRowCancelingEdit="StudentGrid_RowCancelingEdit" 
           OnRowDeleting="StudentGrid_RowDeleting" OnRowDataBound="StudentGrid_RowDataBound" OnRowUpdating="StudentGrid_RowUpdating" OnRowEditing="StudentGrid_RowEditing" DataKeyNames="SID">
           <Columns>
               <asp:templatefield headertext="Student ID">
                <itemtemplate>
                    <asp:label id="SID" runat='server' Text='<%#Eval("SID") %>'/>
                  
                </itemtemplate></asp:templatefield>
            
            <asp:templatefield headertext="First Name" ><itemtemplate> <%#Eval("FName") %></itemtemplate> 
            <edititemtemplate>
            <asp:textbox id="textbox1" runat='server' text='<%#Eval("FName") %>'></asp:textbox>
                <asp:RegularExpressionValidator ID="textbox1Checker" runat="server" ErrorMessage="Invaild input" ControlToValidate="textbox1" ValidationExpression="^[a-zA-Z\s]+$" />
            </edititemtemplate>
            </asp:templatefield>
            
            <asp:templatefield headertext="Middle Name"><itemtemplate><%#Eval("MName") %> </itemtemplate>
                <edititemtemplate>
                <asp:textbox id="textbox2" runat='server' text='<%#Eval("MName") %>'></asp:textbox>
                    <asp:RegularExpressionValidator ID="textbox2Checker" runat="server" ErrorMessage="Invaild input" ControlToValidate="textbox2" ValidationExpression="^[a-zA-Z\s]+$" />
                </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="Last Name"><itemtemplate><%#Eval("LName") %> </itemtemplate>
                <edititemtemplate>
                <asp:textbox id="textbox3" runat='server' text='<%#Eval("LName") %>'></asp:textbox>
                    <asp:RegularExpressionValidator ID="textbox3Checker" runat="server" ErrorMessage="Incorrect, must be letters ." ControlToValidate="textbox3" ValidationExpression="^[a-zA-Z\s]+$" />
                </edititemtemplate>
            </asp:templatefield>
            
            <asp:templatefield headertext="Project ID"><itemtemplate><%#Eval("PId") %> </itemtemplate>
                <edititemtemplate>
                <asp:DropDownList ID="ddlPID" runat="server" Font-Size="10pt" Height="20pt" >
                </asp:DropDownList>
                </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="School"><itemtemplate><%#Eval("School") %> </itemtemplate>
                <edititemtemplate>
                <asp:textbox id="textbox5" runat='server' text='<%#Eval("School") %>'></asp:textbox>
                    <asp:RegularExpressionValidator ID="textbox5Checker" runat="server" ErrorMessage="Invalid input." ControlToValidate="textbox5" ValidationExpression="^[a-zA-Z\s]+$" />
                </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="Age"><itemtemplate><%#Eval("Age") %> </itemtemplate>
                <edititemtemplate>
                <asp:textbox id="textbox6" runat='server' text='<%#Eval("Age") %>'></asp:textbox>
                    <asp:RegularExpressionValidator ID="textbox6Checker" runat="server" ErrorMessage="Incorrect, must be numbers ." ControlToValidate="textbox6" ValidationExpression="[0-9]{0,2}" />
                </edititemtemplate>
            </asp:templatefield>

            </Columns>
            <PagerTemplate>
                <table align="right" bgcolor="#e9e9e9" width="100%">
                    <tr>
                        <td style="text-align: right">
                            Page <b><asp:Label ID="lblPageIndex" runat="server" Text="<%#((GridView)Container.Parent.Parent).PageIndex + 1 %>"></asp:Label></b>
                            of <b><asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label></b>
                            <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First"
                                CommandName="Page" Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>"
                                Text="First  "></asp:LinkButton>
                            <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev"
                                CommandName="Page" Enabled=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>"
                                Text="<< Previous  "></asp:LinkButton>
                            <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next"
                                CommandName="Page" Enabled=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>"
                                Text="  Next >>"></asp:LinkButton>
                            <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last"
                                CommandName="Page" Enabled=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>"
                                Text="  Last"></asp:LinkButton>
                            <asp:TextBox ID="txtNewPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1%>"
                                Width="20px"></asp:TextBox>
                            <asp:LinkButton ID="btnGo" runat="server" CausesValidation="false" CommandArgument="-1"
                                CommandName="Page" Text="GO"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </PagerTemplate>
       </asp:GridView>
   </asp:Panel>
</asp:Content>
