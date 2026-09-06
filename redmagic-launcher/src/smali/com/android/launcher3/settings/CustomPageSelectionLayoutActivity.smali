.class public Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;
.super LK1/p;
.source "CustomPageSelectionLayoutActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static L:I = 0x0

.field public static M:I = 0x1

.field public static N:I = 0x2


# instance fields
.field private D:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private E:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private F:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private G:Landroid/widget/LinearLayout;

.field private H:Landroid/widget/LinearLayout;

.field private I:Landroid/widget/LinearLayout;

.field private J:Z

.field private K:Lcom/android/launcher3/h0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LK1/p;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private init()V
    .locals 4

    .line 1
    const v0, 0x7f0b04b9

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->D:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 11
    .line 12
    const v0, 0x7f0b04b5

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->E:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 22
    .line 23
    const v0, 0x7f0b04b0

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->F:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 33
    .line 34
    const v0, 0x7f0b0352

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/widget/LinearLayout;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->G:Landroid/widget/LinearLayout;

    .line 44
    .line 45
    const v0, 0x7f0b0347

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Landroid/widget/LinearLayout;

    .line 53
    .line 54
    iput-object v0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->H:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    const v0, 0x7f0b0341

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Landroid/widget/LinearLayout;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->I:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->G:Landroid/widget/LinearLayout;

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->H:Landroid/widget/LinearLayout;

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->I:Landroid/widget/LinearLayout;

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget v0, v0, Lcom/android/launcher3/r4;->y:I

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-static {v1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->H0()Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    const/16 v2, 0x8

    .line 109
    .line 110
    if-eqz v1, :cond_0

    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    sget-object v3, Lcom/android/launcher3/r4;->A0:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v1, v3}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_1

    .line 123
    .line 124
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->G:Landroid/widget/LinearLayout;

    .line 125
    .line 126
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 127
    .line 128
    .line 129
    sget v1, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->M:I

    .line 130
    .line 131
    if-ne v0, v1, :cond_1

    .line 132
    .line 133
    sget v0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->N:I

    .line 134
    .line 135
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-static {v1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->J0()Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-nez v1, :cond_2

    .line 148
    .line 149
    iget-object v1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->H:Landroid/widget/LinearLayout;

    .line 150
    .line 151
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 152
    .line 153
    .line 154
    sget v1, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->N:I

    .line 155
    .line 156
    if-ne v0, v1, :cond_2

    .line 157
    .line 158
    sget v0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->M:I

    .line 159
    .line 160
    :cond_2
    invoke-direct {p0, v0}, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->r0(I)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method private p0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const v1, 0x7f1403ac

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->K:Lcom/android/launcher3/h0;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 31
    .line 32
    invoke-virtual {p0, v2}, Lcom/android/launcher3/r4;->E(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private q0(I)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f1403ae

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private r0(I)V
    .locals 3

    .line 1
    sget v0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->L:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->F:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 8
    .line 9
    invoke-virtual {p1, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->D:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->E:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->I:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->G:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->H:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v1}, Lcom/android/launcher3/C2;->r4(Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    sget v0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->M:I

    .line 52
    .line 53
    if-ne p1, v0, :cond_1

    .line 54
    .line 55
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->F:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->D:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 61
    .line 62
    invoke-virtual {p1, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->E:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->I:Landroid/widget/LinearLayout;

    .line 71
    .line 72
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->G:Landroid/widget/LinearLayout;

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->H:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 83
    .line 84
    .line 85
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    if-eqz p0, :cond_2

    .line 90
    .line 91
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, v2}, Lcom/android/launcher3/C2;->r4(Z)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    sget v0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->N:I

    .line 100
    .line 101
    if-ne p1, v0, :cond_2

    .line 102
    .line 103
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->F:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 104
    .line 105
    invoke-virtual {p1, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->D:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 109
    .line 110
    invoke-virtual {p1, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->E:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 114
    .line 115
    invoke-virtual {p1, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->I:Landroid/widget/LinearLayout;

    .line 119
    .line 120
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->G:Landroid/widget/LinearLayout;

    .line 124
    .line 125
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->H:Landroid/widget/LinearLayout;

    .line 129
    .line 130
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 131
    .line 132
    .line 133
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    if-eqz p0, :cond_2

    .line 138
    .line 139
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0, v2}, Lcom/android/launcher3/C2;->r4(Z)V

    .line 144
    .line 145
    .line 146
    :cond_2
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const v0, 0x7f0b0341

    .line 6
    .line 7
    .line 8
    if-eq p1, v0, :cond_2

    .line 9
    .line 10
    const v0, 0x7f0b0347

    .line 11
    .line 12
    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    const v0, 0x7f0b0352

    .line 16
    .line 17
    .line 18
    if-eq p1, v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->D:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 22
    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_3

    .line 30
    .line 31
    sget p1, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->M:I

    .line 32
    .line 33
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->q0(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->K:Lcom/android/launcher3/h0;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Lcom/android/launcher3/r4;->O(Landroid/content/Context;)I

    .line 41
    .line 42
    .line 43
    sget p1, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->M:I

    .line 44
    .line 45
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->r0(I)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->p0()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->E:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 53
    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_3

    .line 61
    .line 62
    sget p1, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->N:I

    .line 63
    .line 64
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->q0(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->K:Lcom/android/launcher3/h0;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Lcom/android/launcher3/r4;->O(Landroid/content/Context;)I

    .line 72
    .line 73
    .line 74
    sget p1, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->N:I

    .line 75
    .line 76
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->r0(I)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0}, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->p0()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->F:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 84
    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_3

    .line 92
    .line 93
    sget p1, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->L:I

    .line 94
    .line 95
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->q0(I)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->K:Lcom/android/launcher3/h0;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 101
    .line 102
    invoke-virtual {p1, p0}, Lcom/android/launcher3/r4;->O(Landroid/content/Context;)I

    .line 103
    .line 104
    .line 105
    sget p1, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->L:I

    .line 106
    .line 107
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->r0(I)V

    .line 108
    .line 109
    .line 110
    :cond_3
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, LK1/p;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1, v0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->K:Lcom/android/launcher3/h0;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    const-string v0, "isFromSettings"

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput-boolean p1, p0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->J:Z

    .line 40
    .line 41
    :cond_0
    const p1, 0x7f14010f

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const v0, 0x7f0e01fa

    .line 49
    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {p0, p1, v0, v1}, LK1/o;->n0(Ljava/lang/String;ILandroidx/fragment/app/n;)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0}, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->init()V

    .line 56
    .line 57
    .line 58
    return-void
.end method
