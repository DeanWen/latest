﻿<%@ Page Title="Judge" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Judge.aspx.cs" Inherits="Judge" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label ID="JidMsg" CssClass="form lable" runat="server">Enter Judge ID: </asp:Label>
    <asp:TextBox ID="JidTxt" OnTextChanged="getJudgeById" runat="server"></asp:TextBox>
    <asp:Button ID="search" class="button"  Visible="true" Text="Search" runat="server" onclick="getJudgeById" />
    <asp:RegularExpressionValidator ID="checkuname" runat="server" ErrorMessage="Incorrect, must be between 4-10 bits letters or numbers ." ControlToValidate="JidTxt" ValidationExpression="[a-zA-Z0-9]{4,10}" />

		

    <asp:Panel ID="PnlTable" runat="server">
       <asp:GridView ID="Grid1" runat="server"  AutoGenerateColumns="False" AllowPaging="true" 
           OnPageIndexChanging="PageIndexChanging" AutoGenerateDeleteButton="true"
            AutoGenerateEditButton="true" OnRowCancelingEdit="Grid1_RowCancelingEdit" 
           OnRowDeleting="Grid1_RowDeleting" OnRowEditing="Grid1_RowEditing"
            OnRowUpdating="Grid1_RowUpdating" DataKeyNames="JID" OnRowDataBound="Grid1_RowDataBound">
            <columns>
            
            <asp:templatefield headertext="Judge ID">
                <itemtemplate>
                    <asp:label id="jid" runat='server' Text='<%#Eval("jid") %>'/>
                  
                </itemtemplate></asp:templatefield>
            
            <asp:templatefield headertext="First Name"><itemtemplate> <%#Eval("FName") %></itemtemplate> 
            <edititemtemplate>
            <asp:textbox id="textbox1" runat='server' text='<%#Eval("FName") %>'></asp:textbox>
                 <asp:RegularExpressionValidator ID="textbox1Checker" runat="server" ErrorMessage="Invaild input" ControlToValidate="textbox1" ValidationExpression="^[a-zA-Z\s]+$" />
            </edititemtemplate>
            </asp:templatefield>
            
            <asp:templatefield headertext="Last Name"><itemtemplate><%#Eval("LName") %> </itemtemplate>
           <edititemtemplate>
           <asp:textbox id="textbox2" runat='server' text='<%#Eval("LName") %>'></asp:textbox>
               <asp:RegularExpressionValidator ID="textbox02Checker" runat="server" ErrorMessage="Invaild input" ControlToValidate="textbox2" ValidationExpression="^[a-zA-Z\s]+$" />
           </edititemtemplate>
            </asp:templatefield>
            
            <asp:templatefield headertext="CategoryA"><itemtemplate><%#Eval("CategoryA") %> </itemtemplate>
           <edititemtemplate>

            <asp:DropDownList ID="CA" runat="server" Font-Size="10pt" Height="20pt" ></asp:DropDownList>
                 
           </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="CategoryB"><itemtemplate><%#Eval("CategoryB") %> </itemtemplate>
           <edititemtemplate>
 
               <asp:DropDownList ID="CB" runat="server" Font-Size="10pt" Height="20pt" ></asp:DropDownList>
           </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="CategoryC"><itemtemplate><%#Eval("CategoryC") %> </itemtemplate>
           <edititemtemplate>
 
               <asp:DropDownList ID="CC" runat="server" Font-Size="10pt" Height="20pt" ></asp:DropDownList>
           </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="CategoryD"><itemtemplate><%#Eval("CategoryD") %> </itemtemplate>
           <edititemtemplate>

               <asp:DropDownList ID="CD" runat="server" Font-Size="10pt" Height="20pt" ></asp:DropDownList>
           </edititemtemplate>
            </asp:templatefield>

            <asp:templatefield headertext="Division"><itemtemplate><%#Eval("Division") %> </itemtemplate>
           <edititemtemplate>
               <asp:DropDownList ID="D" runat="server" Font-Size="10pt" Height="20pt" >
               </asp:DropDownList>
           </edititemtemplate>
            </asp:templatefield>
            
            </columns>

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
