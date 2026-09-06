.class public Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;
.super LK1/p;
.source "ConcernStandardFeatureModeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private D:Landroid/widget/TextView;

.field private E:Landroid/widget/TextView;

.field private F:Landroid/widget/TextView;

.field private G:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private H:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private I:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private J:Landroid/widget/ImageView;

.field private K:Landroid/widget/ImageView;

.field private L:Landroid/widget/ImageView;

.field private M:Landroid/widget/TextView;

.field private N:Landroid/widget/TextView;

.field private O:Landroid/widget/TextView;

.field private P:Landroid/widget/LinearLayout;

.field private Q:Landroid/widget/LinearLayout;

.field private R:Landroid/widget/LinearLayout;

.field private S:Z

.field private T:Z

.field private U:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LK1/p;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private A0(ZZZZZ)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->G:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->H:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1, p3}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->I:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    invoke-virtual {p1, p4}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 20
    .line 21
    .line 22
    :cond_2
    const/4 p1, 0x1

    .line 23
    const/4 p4, 0x0

    .line 24
    if-eqz p2, :cond_4

    .line 25
    .line 26
    iget-boolean p2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->T:Z

    .line 27
    .line 28
    if-eqz p2, :cond_3

    .line 29
    .line 30
    iget-boolean p2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->S:Z

    .line 31
    .line 32
    if-nez p2, :cond_3

    .line 33
    .line 34
    iget-object p2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    invoke-virtual {p2, p4}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_3
    iget-object p2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 43
    .line 44
    .line 45
    :cond_4
    :goto_0
    if-eqz p3, :cond_6

    .line 46
    .line 47
    iget-boolean p2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->S:Z

    .line 48
    .line 49
    if-eqz p2, :cond_5

    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 52
    .line 53
    invoke-virtual {p0, p4}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 60
    .line 61
    .line 62
    :cond_6
    return-void
.end method

.method private init()V
    .locals 15

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iput-boolean v1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->T:Z

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iput-boolean v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->T:Z

    .line 25
    .line 26
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iput-boolean v1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->S:Z

    .line 37
    .line 38
    const/4 v7, 0x0

    .line 39
    const/4 v8, 0x0

    .line 40
    const/4 v4, 0x0

    .line 41
    const/4 v5, 0x0

    .line 42
    const/4 v6, 0x1

    .line 43
    move-object v3, p0

    .line 44
    invoke-direct/range {v3 .. v8}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->A0(ZZZZZ)V

    .line 45
    .line 46
    .line 47
    move-object v9, v3

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    move-object v9, p0

    .line 50
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    iput-boolean v2, v9, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->S:Z

    .line 61
    .line 62
    const/4 v13, 0x0

    .line 63
    const/4 v14, 0x1

    .line 64
    const/4 v10, 0x0

    .line 65
    const/4 v11, 0x0

    .line 66
    const/4 v12, 0x0

    .line 67
    invoke-direct/range {v9 .. v14}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->A0(ZZZZZ)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    iput-boolean v2, v9, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->S:Z

    .line 72
    .line 73
    iget-boolean p0, v9, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->T:Z

    .line 74
    .line 75
    if-eqz p0, :cond_3

    .line 76
    .line 77
    const/4 v13, 0x0

    .line 78
    const/4 v14, 0x0

    .line 79
    const/4 v10, 0x0

    .line 80
    const/4 v11, 0x1

    .line 81
    const/4 v12, 0x0

    .line 82
    invoke-direct/range {v9 .. v14}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->A0(ZZZZZ)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    const/4 v13, 0x0

    .line 87
    const/4 v14, 0x0

    .line 88
    const/4 v10, 0x1

    .line 89
    const/4 v11, 0x0

    .line 90
    const/4 v12, 0x0

    .line 91
    invoke-direct/range {v9 .. v14}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->A0(ZZZZZ)V

    .line 92
    .line 93
    .line 94
    :goto_1
    iget-object p0, v9, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 95
    .line 96
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const-string v0, "com.zte.easymode"

    .line 104
    .line 105
    invoke-static {p0, v0}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    const/4 v0, 0x0

    .line 110
    const/16 v1, 0x8

    .line 111
    .line 112
    if-eqz p0, :cond_4

    .line 113
    .line 114
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->G0()Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-eqz p0, :cond_4

    .line 127
    .line 128
    iget-object p0, v9, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 129
    .line 130
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_4
    iget-object p0, v9, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 135
    .line 136
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    iput-object v0, v9, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->H:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 140
    .line 141
    :goto_2
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    const-string v2, "com.zte.mifavor.elderlylauncher"

    .line 146
    .line 147
    invoke-static {p0, v2}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    if-eqz p0, :cond_5

    .line 152
    .line 153
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->G0()Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-eqz p0, :cond_5

    .line 166
    .line 167
    iget-object p0, v9, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->R:Landroid/widget/LinearLayout;

    .line 168
    .line 169
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_5
    iget-object p0, v9, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->R:Landroid/widget/LinearLayout;

    .line 174
    .line 175
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 176
    .line 177
    .line 178
    iput-object v0, v9, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->I:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 179
    .line 180
    return-void
.end method

.method public static synthetic p0()V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "com.android.settings"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/g0;->r(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception v0

    .line 18
    const-string v1, "HomeScreenLayoutActivity"

    .line 19
    .line 20
    const-string v2, "switchFeatureHome: stop settings process failed. "

    .line 21
    .line 22
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static synthetic q0()V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "com.android.settings"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/resource/g0;->r(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception v0

    .line 18
    const-string v1, "HomeScreenLayoutActivity"

    .line 19
    .line 20
    const-string v2, "switchHomeLayout: stop settings process failed. "

    .line 21
    .line 22
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method static bridge synthetic r0(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->S:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic s0(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->x0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic t0(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;ZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->y0(ZZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic u0(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;ZZZZZ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->A0(ZZZZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private v0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->G:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    move v1, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move v1, v2

    .line 25
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->H:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/widget/RadioButton;->isChecked()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    move v2, v3

    .line 41
    :cond_2
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 42
    .line 43
    .line 44
    :cond_3
    :goto_1
    return-void
.end method

.method private w0(Landroid/content/Intent;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->H:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/RadioButton;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    if-eqz p1, :cond_2

    .line 15
    .line 16
    const-string v0, "EasyModeCommand"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v1, "easyModeCommand="

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "HomeScreenLayoutActivity"

    .line 40
    .line 41
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    const-string v0, "open"

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    const/4 v5, 0x0

    .line 59
    const/4 v6, 0x0

    .line 60
    const/4 v2, 0x0

    .line 61
    const/4 v3, 0x0

    .line 62
    const/4 v4, 0x1

    .line 63
    move-object v1, p0

    .line 64
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->A0(ZZZZZ)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    move-object v1, p0

    .line 69
    const-string p0, "close"

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    const/4 v11, 0x0

    .line 78
    const/4 v12, 0x0

    .line 79
    const/4 v8, 0x0

    .line 80
    const/4 v9, 0x1

    .line 81
    const/4 v10, 0x0

    .line 82
    move-object v7, v1

    .line 83
    invoke-direct/range {v7 .. v12}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->A0(ZZZZZ)V

    .line 84
    .line 85
    .line 86
    :cond_2
    :goto_0
    return-void
.end method

.method private x0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, LK1/d;

    .line 4
    .line 5
    invoke-direct {v1}, LK1/d;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lx1/O;->I4(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "content://com.zte.easymode.settings.SettingsProvider"

    .line 19
    .line 20
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v1, "feature_mode_set"

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {p0, v0, v1, v2, v2}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catch_0
    move-exception p0

    .line 36
    const-string v0, "HomeScreenLayoutActivity"

    .line 37
    .line 38
    const-string v1, "Error switching to feature home mode"

    .line 39
    .line 40
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private y0(ZZZ)V
    .locals 7

    .line 1
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p3}, Lx1/C;->h()Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    const-string p0, "HomeScreenLayoutActivity"

    .line 18
    .line 19
    const-string p1, "switchHomeLayout--loadingToast is show"

    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object p3, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 26
    .line 27
    new-instance v0, LK1/c;

    .line 28
    .line 29
    invoke-direct {v0}, LK1/c;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p3, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-static {p3}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    invoke-virtual {p3}, Lcom/android/launcher3/H5;->s1()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-static {p3}, Lx1/C;->f(Landroid/content/Context;)Lx1/C;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-virtual {p3}, Lx1/C;->j()V

    .line 55
    .line 56
    .line 57
    iget-boolean p3, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->T:Z

    .line 58
    .line 59
    if-eq p3, p1, :cond_1

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    invoke-static {p3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    invoke-virtual {p3}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-virtual {p3, p1}, Lcom/android/launcher3/H5;->w1(Z)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    invoke-virtual {p3, p1}, Lcom/android/launcher3/resource/B;->e(Z)V

    .line 81
    .line 82
    .line 83
    :cond_1
    iget-boolean p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->S:Z

    .line 84
    .line 85
    if-eq p1, p2, :cond_2

    .line 86
    .line 87
    :try_start_0
    const-string p1, "content://com.zte.easymode.settings.SettingsProvider"

    .line 88
    .line 89
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-virtual {p3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    const-string v0, "ease_mode_set"

    .line 102
    .line 103
    const-string v1, "mfvLauncher"

    .line 104
    .line 105
    const/4 v2, 0x0

    .line 106
    invoke-virtual {p3, p1, v0, v1, v2}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :catch_0
    move-exception v0

    .line 111
    move-object p1, v0

    .line 112
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 113
    .line 114
    .line 115
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1, p2}, Lcom/android/launcher3/resource/B;->c(Z)V

    .line 120
    .line 121
    .line 122
    :cond_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->d()V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Lx1/O;->z5()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_3

    .line 134
    .line 135
    const/4 p1, 0x2

    .line 136
    const-wide/16 p2, 0xbb8

    .line 137
    .line 138
    const-string v0, "com.zte.mifavor.launcher"

    .line 139
    .line 140
    invoke-static {v0, p1, p2, p3}, Lx1/O;->z4(Ljava/lang/String;IJ)V

    .line 141
    .line 142
    .line 143
    :cond_3
    sget-object p1, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    move-object v0, p1

    .line 154
    check-cast v0, Lcom/android/launcher3/F1;

    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->q()Z

    .line 165
    .line 166
    .line 167
    move-result v5

    .line 168
    const/4 v6, 0x0

    .line 169
    const/4 v2, 0x1

    .line 170
    const/4 v3, 0x0

    .line 171
    const/4 v4, 0x1

    .line 172
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/F1;->q0(Landroid/content/Context;ZZZZZ)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method private z0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    const/4 v2, 0x1

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iput-boolean v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->T:Z

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iput-boolean v1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->T:Z

    .line 25
    .line 26
    :goto_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iput-boolean v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->S:Z

    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iput-boolean v1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->S:Z

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const v0, 0x7f14038f

    .line 6
    .line 7
    .line 8
    const v1, 0x7f140392

    .line 9
    .line 10
    .line 11
    const v2, 0x7f140398

    .line 12
    .line 13
    .line 14
    packed-switch p1, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    :pswitch_0
    goto/16 :goto_0

    .line 18
    .line 19
    :pswitch_1
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->G:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lx1/e;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v2}, Lx1/e;->n(I)Lx1/e;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const v2, 0x7f140397

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v2, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$b;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$b;-><init>(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v1, v2}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v1, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$a;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$a;-><init>(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v0, v1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    goto :goto_1

    .line 68
    :pswitch_2
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->I:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 69
    .line 70
    if-eqz p1, :cond_0

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_0

    .line 77
    .line 78
    new-instance p1, Lx1/e;

    .line 79
    .line 80
    invoke-direct {p1, p0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v2}, Lx1/e;->n(I)Lx1/e;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const v2, 0x7f140395

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance v2, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$f;

    .line 95
    .line 96
    invoke-direct {v2, p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$f;-><init>(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, v1, v2}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    new-instance v1, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$e;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$e;-><init>(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v0, v1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    goto :goto_1

    .line 117
    :pswitch_3
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->H:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 118
    .line 119
    if-eqz p1, :cond_0

    .line 120
    .line 121
    invoke-virtual {p1}, Landroid/widget/RadioButton;->isChecked()Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-nez p1, :cond_0

    .line 126
    .line 127
    new-instance p1, Lx1/e;

    .line 128
    .line 129
    invoke-direct {p1, p0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, v2}, Lx1/e;->n(I)Lx1/e;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    const v2, 0x7f140390

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, v2}, Lx1/e;->d(I)Lx1/e;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    new-instance v2, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$d;

    .line 144
    .line 145
    invoke-direct {v2, p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$d;-><init>(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1, v1, v2}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    new-instance v1, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$c;

    .line 153
    .line 154
    invoke-direct {v1, p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$c;-><init>(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1, v0, v1}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p1}, Lx1/e;->p()Landroid/app/Dialog;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    goto :goto_1

    .line 166
    :cond_0
    :goto_0
    const/4 p1, 0x0

    .line 167
    :goto_1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_1

    .line 172
    .line 173
    if-eqz p1, :cond_1

    .line 174
    .line 175
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    const v0, 0x7f070ab2

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    const/4 v0, -0x2

    .line 191
    invoke-virtual {p1, p0, v0}, Landroid/view/Window;->setLayout(II)V

    .line 192
    .line 193
    .line 194
    :cond_1
    return-void

    .line 195
    :pswitch_data_0
    .packed-switch 0x7f0b0345
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

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
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const-string v2, "isFromSettings"

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput-boolean v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->U:Z

    .line 38
    .line 39
    :cond_0
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v2, 0x0

    .line 44
    const v3, 0x7f0e0090

    .line 45
    .line 46
    .line 47
    const v4, 0x7f140399

    .line 48
    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-boolean v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->U:Z

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0, v3, v2}, LK1/o;->n0(Ljava/lang/String;ILandroidx/fragment/app/n;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-boolean v4, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 69
    .line 70
    if-eqz v4, :cond_2

    .line 71
    .line 72
    const v3, 0x7f0e0091

    .line 73
    .line 74
    .line 75
    :cond_2
    invoke-virtual {p0, v0, v3, v2}, LK1/o;->n0(Ljava/lang/String;ILandroidx/fragment/app/n;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    const v0, 0x7f0b0350

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Landroid/widget/TextView;

    .line 86
    .line 87
    iput-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->D:Landroid/widget/TextView;

    .line 88
    .line 89
    const v0, 0x7f0b034d

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Landroid/widget/TextView;

    .line 97
    .line 98
    iput-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->E:Landroid/widget/TextView;

    .line 99
    .line 100
    const v0, 0x7f0b02e1

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Landroid/widget/TextView;

    .line 108
    .line 109
    iput-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->F:Landroid/widget/TextView;

    .line 110
    .line 111
    const v2, 0x7f0b04b8

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 119
    .line 120
    iput-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->G:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 121
    .line 122
    const v2, 0x7f0b04b3

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    check-cast v2, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 130
    .line 131
    iput-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->H:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 132
    .line 133
    const v2, 0x7f0b04b4

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    check-cast v2, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 141
    .line 142
    iput-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->I:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 143
    .line 144
    const v2, 0x7f0b02dd

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    check-cast v2, Landroid/widget/ImageView;

    .line 152
    .line 153
    iput-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->J:Landroid/widget/ImageView;

    .line 154
    .line 155
    const v2, 0x7f0b02db

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    check-cast v2, Landroid/widget/ImageView;

    .line 163
    .line 164
    iput-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->K:Landroid/widget/ImageView;

    .line 165
    .line 166
    const v2, 0x7f0b02dc

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    check-cast v2, Landroid/widget/ImageView;

    .line 174
    .line 175
    iput-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->L:Landroid/widget/ImageView;

    .line 176
    .line 177
    iget-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->K:Landroid/widget/ImageView;

    .line 178
    .line 179
    invoke-static {}, Lm1/a;->d()Z

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    if-eqz v3, :cond_3

    .line 184
    .line 185
    const v3, 0x7f081260

    .line 186
    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_3
    const v3, 0x7f080cbb

    .line 190
    .line 191
    .line 192
    :goto_1
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 193
    .line 194
    .line 195
    const v2, 0x7f0b02e2

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    check-cast v2, Landroid/widget/TextView;

    .line 203
    .line 204
    iput-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->M:Landroid/widget/TextView;

    .line 205
    .line 206
    const v2, 0x7f0b02e0

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    check-cast v2, Landroid/widget/TextView;

    .line 214
    .line 215
    iput-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->N:Landroid/widget/TextView;

    .line 216
    .line 217
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    check-cast v0, Landroid/widget/TextView;

    .line 222
    .line 223
    iput-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->O:Landroid/widget/TextView;

    .line 224
    .line 225
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->N:Landroid/widget/TextView;

    .line 226
    .line 227
    invoke-static {}, Lm1/a;->d()Z

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    if-eqz v2, :cond_4

    .line 232
    .line 233
    const v2, 0x7f140388

    .line 234
    .line 235
    .line 236
    goto :goto_2

    .line 237
    :cond_4
    const v2, 0x7f1400ff

    .line 238
    .line 239
    .line 240
    :goto_2
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 241
    .line 242
    .line 243
    const v0, 0x7f0b0349

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    check-cast v0, Landroid/widget/LinearLayout;

    .line 251
    .line 252
    iput-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 253
    .line 254
    const v0, 0x7f0b0345

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    check-cast v0, Landroid/widget/LinearLayout;

    .line 262
    .line 263
    iput-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 264
    .line 265
    const v0, 0x7f0b0346

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    check-cast v0, Landroid/widget/LinearLayout;

    .line 273
    .line 274
    iput-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->R:Landroid/widget/LinearLayout;

    .line 275
    .line 276
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 277
    .line 278
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 279
    .line 280
    .line 281
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 282
    .line 283
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 284
    .line 285
    .line 286
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->R:Landroid/widget/LinearLayout;

    .line 287
    .line 288
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 289
    .line 290
    .line 291
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 292
    .line 293
    .line 294
    move-result v0

    .line 295
    if-eqz v0, :cond_8

    .line 296
    .line 297
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 298
    .line 299
    if-eqz v0, :cond_5

    .line 300
    .line 301
    iget-boolean v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->U:Z

    .line 302
    .line 303
    if-nez v0, :cond_5

    .line 304
    .line 305
    const v0, 0x7f0b0348

    .line 306
    .line 307
    .line 308
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/c;->findViewById(I)Landroid/view/View;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    check-cast v0, Landroid/widget/LinearLayout;

    .line 313
    .line 314
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 315
    .line 316
    .line 317
    move-result-object v2

    .line 318
    const v3, 0x7f0709b7

    .line 319
    .line 320
    .line 321
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 322
    .line 323
    .line 324
    move-result v2

    .line 325
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 326
    .line 327
    .line 328
    move-result v4

    .line 329
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 330
    .line 331
    .line 332
    move-result-object v5

    .line 333
    invoke-virtual {v5, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 334
    .line 335
    .line 336
    move-result v3

    .line 337
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    .line 338
    .line 339
    .line 340
    move-result v5

    .line 341
    invoke-virtual {v0, v2, v4, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 342
    .line 343
    .line 344
    :cond_5
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 345
    .line 346
    if-nez v0, :cond_6

    .line 347
    .line 348
    iget-boolean v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->U:Z

    .line 349
    .line 350
    if-eqz v0, :cond_6

    .line 351
    .line 352
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->J:Landroid/widget/ImageView;

    .line 353
    .line 354
    const v2, 0x7f080cbf

    .line 355
    .line 356
    .line 357
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 358
    .line 359
    .line 360
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->J:Landroid/widget/ImageView;

    .line 361
    .line 362
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    const v3, 0x7f0704d7

    .line 371
    .line 372
    .line 373
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 374
    .line 375
    .line 376
    move-result v2

    .line 377
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 378
    .line 379
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    const v3, 0x7f0704d6

    .line 384
    .line 385
    .line 386
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 387
    .line 388
    .line 389
    move-result v2

    .line 390
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 391
    .line 392
    iget-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->J:Landroid/widget/ImageView;

    .line 393
    .line 394
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 395
    .line 396
    .line 397
    :cond_6
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 398
    .line 399
    if-eqz p1, :cond_7

    .line 400
    .line 401
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 402
    .line 403
    .line 404
    move-result-object p1

    .line 405
    const v0, 0x7f0707b1

    .line 406
    .line 407
    .line 408
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 409
    .line 410
    .line 411
    move-result p1

    .line 412
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->J:Landroid/widget/ImageView;

    .line 413
    .line 414
    invoke-virtual {v0}, Landroid/widget/ImageView;->getPaddingTop()I

    .line 415
    .line 416
    .line 417
    move-result v2

    .line 418
    iget-object v3, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->J:Landroid/widget/ImageView;

    .line 419
    .line 420
    invoke-virtual {v3}, Landroid/widget/ImageView;->getPaddingBottom()I

    .line 421
    .line 422
    .line 423
    move-result v3

    .line 424
    invoke-virtual {v0, p1, v2, p1, v3}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 425
    .line 426
    .line 427
    :cond_7
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 428
    .line 429
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    iget-object v2, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 434
    .line 435
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 436
    .line 437
    .line 438
    move-result v2

    .line 439
    iget-object v3, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 440
    .line 441
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 442
    .line 443
    .line 444
    move-result v3

    .line 445
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 446
    .line 447
    .line 448
    move-result-object v4

    .line 449
    const v5, 0x7f0709ae

    .line 450
    .line 451
    .line 452
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 453
    .line 454
    .line 455
    move-result v4

    .line 456
    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 457
    .line 458
    .line 459
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 460
    .line 461
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 462
    .line 463
    .line 464
    move-result-object p1

    .line 465
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 466
    .line 467
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    const v2, 0x7f0709aa

    .line 472
    .line 473
    .line 474
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 475
    .line 476
    .line 477
    move-result v0

    .line 478
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 479
    .line 480
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->P:Landroid/widget/LinearLayout;

    .line 481
    .line 482
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 483
    .line 484
    .line 485
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->M:Landroid/widget/TextView;

    .line 486
    .line 487
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    const v2, 0x7f07036b

    .line 492
    .line 493
    .line 494
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 495
    .line 496
    .line 497
    move-result v0

    .line 498
    int-to-float v0, v0

    .line 499
    invoke-virtual {p1, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 500
    .line 501
    .line 502
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 503
    .line 504
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 505
    .line 506
    .line 507
    move-result v0

    .line 508
    iget-object v3, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 509
    .line 510
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 511
    .line 512
    .line 513
    move-result v3

    .line 514
    iget-object v4, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 515
    .line 516
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 517
    .line 518
    .line 519
    move-result v4

    .line 520
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 521
    .line 522
    .line 523
    move-result-object v6

    .line 524
    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 525
    .line 526
    .line 527
    move-result v6

    .line 528
    invoke-virtual {p1, v0, v3, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 529
    .line 530
    .line 531
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->N:Landroid/widget/TextView;

    .line 532
    .line 533
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 534
    .line 535
    .line 536
    move-result-object v0

    .line 537
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 538
    .line 539
    .line 540
    move-result v0

    .line 541
    int-to-float v0, v0

    .line 542
    invoke-virtual {p1, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 543
    .line 544
    .line 545
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 546
    .line 547
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 548
    .line 549
    .line 550
    move-result-object p1

    .line 551
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 552
    .line 553
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 554
    .line 555
    .line 556
    move-result-object v0

    .line 557
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 558
    .line 559
    .line 560
    move-result v0

    .line 561
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 562
    .line 563
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->Q:Landroid/widget/LinearLayout;

    .line 564
    .line 565
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 566
    .line 567
    .line 568
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->R:Landroid/widget/LinearLayout;

    .line 569
    .line 570
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 571
    .line 572
    .line 573
    move-result v0

    .line 574
    iget-object v3, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->R:Landroid/widget/LinearLayout;

    .line 575
    .line 576
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 577
    .line 578
    .line 579
    move-result v3

    .line 580
    iget-object v4, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->R:Landroid/widget/LinearLayout;

    .line 581
    .line 582
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getPaddingRight()I

    .line 583
    .line 584
    .line 585
    move-result v4

    .line 586
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 587
    .line 588
    .line 589
    move-result-object v6

    .line 590
    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 591
    .line 592
    .line 593
    move-result v6

    .line 594
    invoke-virtual {p1, v0, v3, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 595
    .line 596
    .line 597
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->O:Landroid/widget/TextView;

    .line 598
    .line 599
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 604
    .line 605
    .line 606
    move-result v0

    .line 607
    int-to-float v0, v0

    .line 608
    invoke-virtual {p1, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 609
    .line 610
    .line 611
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->R:Landroid/widget/LinearLayout;

    .line 612
    .line 613
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 614
    .line 615
    .line 616
    move-result-object p1

    .line 617
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 618
    .line 619
    invoke-virtual {p0}, Landroidx/appcompat/app/c;->getResources()Landroid/content/res/Resources;

    .line 620
    .line 621
    .line 622
    move-result-object v0

    .line 623
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 624
    .line 625
    .line 626
    move-result v0

    .line 627
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 628
    .line 629
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->R:Landroid/widget/LinearLayout;

    .line 630
    .line 631
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 632
    .line 633
    .line 634
    :cond_8
    invoke-direct {p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->init()V

    .line 635
    .line 636
    .line 637
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 638
    .line 639
    .line 640
    move-result-object p1

    .line 641
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->w0(Landroid/content/Intent;)V

    .line 642
    .line 643
    .line 644
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/activity/h;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->w0(Landroid/content/Intent;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const-string p1, "HomeScreenLayoutActivity"

    .line 7
    .line 8
    const-string v0, "restoreButtonState"

    .line 9
    .line 10
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->v0()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, LW3/b;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->z0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->init()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->v0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
