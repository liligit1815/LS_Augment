.class public Lcom/android/launcher3/settings/RecentAppStyleActivity;
.super LK1/p;
.source "RecentAppStyleActivity.java"

.implements Landroid/view/View$OnClickListener;

.field private D:Landroid/widget/TextView;
.field private E:Landroid/widget/TextView;
.field private F:Lcom/zte/mifavor/widget/RadioButtonZTE;
.field private G:Lcom/zte/mifavor/widget/RadioButtonZTE;
.field private H:Landroid/widget/ImageView;
.field private I:Landroid/widget/ImageView;
.field private J:Landroid/widget/LinearLayout;
.field private K:Landroid/widget/LinearLayout;
.field private L:Lcom/android/launcher3/h0;
.field private M:Lcom/zte/mifavor/widget/RadioButtonZTE;
.field private N:Landroid/widget/LinearLayout;
.field private O:Lcom/zte/mifavor/widget/SwitchZTE;
.field private P:Landroid/widget/LinearLayout;

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, LK1/p;-><init>()V
    return-void
.end method

.method private init()V
    .locals 3

    const v0, 0x7f0b04b7
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Lcom/zte/mifavor/widget/RadioButtonZTE;
    iput-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->F:Lcom/zte/mifavor/widget/RadioButtonZTE;

    const v0, 0x7f0b04b6
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Lcom/zte/mifavor/widget/RadioButtonZTE;
    iput-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->G:Lcom/zte/mifavor/widget/RadioButtonZTE;

    const v0, 0x7f0b06c4
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Lcom/zte/mifavor/widget/RadioButtonZTE;
    iput-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->M:Lcom/zte/mifavor/widget/RadioButtonZTE;

    const v0, 0x7f0b0423
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/LinearLayout;
    iput-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->J:Landroid/widget/LinearLayout;

    const v0, 0x7f0b02b1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/LinearLayout;
    iput-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->K:Landroid/widget/LinearLayout;

    const v0, 0x7f0b06c2
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/LinearLayout;
    iput-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->N:Landroid/widget/LinearLayout;

    const v0, 0x7f0b06cc
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Lcom/zte/mifavor/widget/SwitchZTE;
    iput-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->O:Lcom/zte/mifavor/widget/SwitchZTE;

    const v0, 0x7f0b06cb
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/LinearLayout;
    iput-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->P:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->J:Landroid/widget/LinearLayout;
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    iget-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->K:Landroid/widget/LinearLayout;
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    iget-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->N:Landroid/widget/LinearLayout;
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    iget-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->P:Landroid/widget/LinearLayout;
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object v0
    const v1, 0x7f1403b7
    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    iget-object v2, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->L:Lcom/android/launcher3/h0;
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;
    iget v2, v2, Lcom/android/launcher3/r4;->o0:I
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result v0
    invoke-direct {p0, v0}, Lcom/android/launcher3/settings/RecentAppStyleActivity;->q0(I)V
    invoke-direct {p0}, Lcom/android/launcher3/settings/RecentAppStyleActivity;->r0()V

    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v1, "ls_recents_stack_show_memory"
    const/4 v2, 0x1
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    iget-object v1, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->O:Lcom/zte/mifavor/widget/SwitchZTE;
    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setChecked(Z)V
    return-void
.end method

.method private p0(I)V
    .locals 2
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const v1, 0x7f1403b7
    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    return-void
.end method

.method private q0(I)V
    .locals 4
    const/4 v0, 0x0
    const/4 v1, 0x1

    move v2, v0
    if-ne p1, v1, :ls_normal_done
    move v2, v1
    :ls_normal_done
    iget-object v3, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->F:Lcom/zte/mifavor/widget/RadioButtonZTE;
    invoke-virtual {v3, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    const/4 v2, 0x2
    if-ne p1, v2, :ls_grid_false
    move v2, v1
    goto :ls_grid_done
    :ls_grid_false
    move v2, v0
    :ls_grid_done
    iget-object v3, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->G:Lcom/zte/mifavor/widget/RadioButtonZTE;
    invoke-virtual {v3, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    const/4 v2, 0x3
    if-ne p1, v2, :ls_stack_false
    move v0, v1
    :ls_stack_false
    iget-object p0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->M:Lcom/zte/mifavor/widget/RadioButtonZTE;
    invoke-virtual {p0, v0}, Landroid/widget/RadioButton;->setChecked(Z)V
    return-void
.end method

.method private r0()V
    .locals 2
    iget-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->F:Lcom/zte/mifavor/widget/RadioButtonZTE;
    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z
    move-result v0
    xor-int/lit8 v0, v0, 0x1
    iget-object v1, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->J:Landroid/widget/LinearLayout;
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    iget-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->G:Lcom/zte/mifavor/widget/RadioButtonZTE;
    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z
    move-result v0
    xor-int/lit8 v0, v0, 0x1
    iget-object v1, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->K:Landroid/widget/LinearLayout;
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    iget-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->M:Lcom/zte/mifavor/widget/RadioButtonZTE;
    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z
    move-result v0
    xor-int/lit8 v0, v0, 0x1
    iget-object p0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->N:Landroid/widget/LinearLayout;
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setEnabled(Z)V
    return-void
.end method

.method private s0(I)V
    .locals 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/RecentAppStyleActivity;->q0(I)V
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/RecentAppStyleActivity;->p0(I)V
    iget-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->L:Lcom/android/launcher3/h0;
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;
    invoke-virtual {v0, p0}, Lcom/android/launcher3/r4;->P(Landroid/content/Context;)I
    invoke-direct {p0}, Lcom/android/launcher3/settings/RecentAppStyleActivity;->r0()V
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    invoke-virtual {p1}, Landroid/view/View;->getId()I
    move-result v0
    const v1, 0x7f0b0423
    if-ne v0, v1, :ls_click_grid
    const/4 v1, 0x1
    invoke-direct {p0, v1}, Lcom/android/launcher3/settings/RecentAppStyleActivity;->s0(I)V
    return-void
    :ls_click_grid
    const v1, 0x7f0b02b1
    if-ne v0, v1, :ls_click_stack
    const/4 v1, 0x2
    invoke-direct {p0, v1}, Lcom/android/launcher3/settings/RecentAppStyleActivity;->s0(I)V
    return-void
    :ls_click_stack
    const v1, 0x7f0b06c2
    if-ne v0, v1, :ls_click_memory
    const/4 v1, 0x3
    invoke-direct {p0, v1}, Lcom/android/launcher3/settings/RecentAppStyleActivity;->s0(I)V
    return-void

    :ls_click_memory
    const v1, 0x7f0b06cb
    if-ne v0, v1, :ls_click_done
    iget-object v0, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->O:Lcom/zte/mifavor/widget/SwitchZTE;
    invoke-virtual {v0}, Landroid/widget/Switch;->isChecked()Z
    move-result v1
    xor-int/lit8 v1, v1, 0x1
    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const-string v2, "ls_recents_stack_show_memory"
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :ls_click_done
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    invoke-super {p0, p1}, LK1/p;->onCreate(Landroid/os/Bundle;)V
    const p1, 0x7f1403c3
    invoke-virtual {p0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
    const v0, 0x7f0e01ff
    const/4 v1, 0x0
    invoke-virtual {p0, p1, v0, v1}, LK1/o;->n0(Ljava/lang/String;ILandroidx/fragment/app/n;)V
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;
    move-result-object p1
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;
    move-result-object p1
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;
    move-result-object p1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;
    move-result-object v0
    invoke-virtual {p1, v0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;
    move-result-object p1
    iput-object p1, p0, Lcom/android/launcher3/settings/RecentAppStyleActivity;->L:Lcom/android/launcher3/h0;
    invoke-direct {p0}, Lcom/android/launcher3/settings/RecentAppStyleActivity;->init()V
    return-void
.end method

.method protected onStart()V
    .locals 0
    invoke-super {p0}, LW3/b;->onStart()V
    invoke-direct {p0}, Lcom/android/launcher3/settings/RecentAppStyleActivity;->r0()V
    return-void
.end method
