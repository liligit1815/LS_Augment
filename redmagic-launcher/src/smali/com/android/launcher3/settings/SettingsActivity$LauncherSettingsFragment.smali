.class public Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;
.super Landroidx/preference/PreferenceFragmentCompat;
.source "SettingsActivity.java"

# interfaces
.implements Lcom/android/launcher3/util/p2$a;


# instance fields
.field protected p:Z

.field private q:Z

.field private r:Ljava/lang/String;

.field private s:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/preference/PreferenceFragmentCompat;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->p:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->q:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->s:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic G(ILandroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    add-int/2addr p0, v3

    .line 18
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/view/View;->setPadding(IIII)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Landroid/view/WindowInsets;->consumeSystemWindowInsets()Landroid/view/WindowInsets;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic H(Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->M(Landroidx/preference/Preference;Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private I()LK1/h;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->r:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_1
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->p()Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroidx/preference/PreferenceGroup$c;

    .line 27
    .line 28
    iget-object v4, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->r:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {v3, v4}, Landroidx/preference/PreferenceGroup$c;->e(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-ltz v3, :cond_2

    .line 35
    .line 36
    new-instance v1, LK1/h;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->r:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Landroidx/preference/PreferenceGroup;->W0(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-direct {v1, v2, v3, p0}, LK1/h;-><init>(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/preference/Preference;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-object v1
.end method

.method private J(Landroidx/preference/PreferenceScreen;Ljava/lang/String;)Landroidx/preference/PreferenceScreen;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v2, v1, Landroidx/preference/PreferenceScreen;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    check-cast v1, Landroidx/preference/PreferenceScreen;

    .line 17
    .line 18
    invoke-direct {p0, v1, p2}, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->J(Landroidx/preference/PreferenceScreen;Ljava/lang/String;)Landroidx/preference/PreferenceScreen;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    return-object v1

    .line 25
    :cond_0
    invoke-virtual {v1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-virtual {v1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    return-object p1

    .line 42
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/4 p0, 0x0

    .line 46
    return-object p0
.end method

.method private L(Ljava/lang/String;Landroidx/preference/PreferenceGroup;)Z
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    invoke-virtual {p2}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ge v0, v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-virtual {v1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return p0
.end method

.method private synthetic M(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p2, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, 0x2

    .line 16
    :goto_0
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method private N()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method protected K(Landroidx/preference/Preference;)Z
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    sget-object v1, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/android/launcher3/util/Z;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    const/4 v4, 0x1

    .line 27
    const/4 v5, -0x1

    .line 28
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    sparse-switch v6, :sswitch_data_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :sswitch_0
    const-string v6, "pref_fixed_landscape_mode"

    .line 37
    .line 38
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move v5, v0

    .line 46
    goto :goto_0

    .line 47
    :sswitch_1
    const-string v6, "pref_allowRotation"

    .line 48
    .line 49
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    move v5, v4

    .line 57
    goto :goto_0

    .line 58
    :sswitch_2
    const-string v6, "pref_developer_options"

    .line 59
    .line 60
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-nez v2, :cond_2

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    move v5, v3

    .line 68
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 69
    .line 70
    .line 71
    return v4

    .line 72
    :pswitch_0
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_4

    .line 77
    .line 78
    sget-object v2, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-virtual {v2, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    check-cast v5, Lcom/android/launcher3/F1;

    .line 89
    .line 90
    iget v5, v5, Lcom/android/launcher3/F1;->P0:I

    .line 91
    .line 92
    if-eq v5, v4, :cond_4

    .line 93
    .line 94
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    invoke-virtual {v2, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    check-cast v2, Lcom/android/launcher3/F1;

    .line 103
    .line 104
    iget v2, v2, Lcom/android/launcher3/F1;->P0:I

    .line 105
    .line 106
    if-ne v2, v0, :cond_3

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_3
    new-instance v0, LK1/i;

    .line 110
    .line 111
    invoke-direct {v0, p0}, LK1/i;-><init>(Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, v1, Lcom/android/launcher3/util/Z$c;->i:Lcom/android/launcher3/util/p3;

    .line 118
    .line 119
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/Z$c;->q(Lcom/android/launcher3/util/p3;)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    xor-int/2addr p0, v4

    .line 124
    return p0

    .line 125
    :cond_4
    :goto_1
    return v3

    .line 126
    :pswitch_1
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-eqz p0, :cond_5

    .line 131
    .line 132
    return v3

    .line 133
    :cond_5
    iget-object p0, v1, Lcom/android/launcher3/util/Z$c;->i:Lcom/android/launcher3/util/p3;

    .line 134
    .line 135
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/Z$c;->q(Lcom/android/launcher3/util/p3;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-eqz p0, :cond_6

    .line 140
    .line 141
    return v3

    .line 142
    :cond_6
    invoke-static {v1}, LQ1/d;->f(Lcom/android/launcher3/util/Z$c;)Z

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->t0(Ljava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    return v4

    .line 154
    :pswitch_2
    iget-boolean p0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->p:Z

    .line 155
    .line 156
    return p0

    .line 157
    :sswitch_data_0
    .sparse-switch
        -0x7711ebf3 -> :sswitch_2
        -0x2f13c735 -> :sswitch_1
        0x12c4e96e -> :sswitch_0
    .end sparse-switch

    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected O()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->isResumed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->N()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->q:Z

    .line 13
    .line 14
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/n;->onDestroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/n;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/n;->isAdded()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->s:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->I()LK1/h;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-wide/16 v2, 0x258

    .line 25
    .line 26
    invoke-virtual {v1, v0, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->s:Z

    .line 31
    .line 32
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->q:Z

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->N()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "android:preference_highlighted"

    .line 5
    .line 6
    iget-boolean p0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->s:Z

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onSettingsChanged(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->O()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/preference/PreferenceFragmentCompat;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->p()Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    new-instance v0, LK1/j;

    .line 13
    .line 14
    invoke-direct {v0, p2}, LK1/j;-><init>(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x5

    .line 21
    invoke-virtual {p1, p0}, Landroid/view/View;->setTextDirection(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public v(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string v1, ":settings:fragment_args_key"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    iput-object v0, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->r:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const-string v0, "android:preference_highlighted"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput-boolean p1, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->s:Z

    .line 26
    .line 27
    :cond_1
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->q()Landroidx/preference/f;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget-object v0, Lcom/android/launcher3/W2;->a:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroidx/preference/f;->q(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const p1, 0x7f17000f

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Landroidx/preference/PreferenceFragmentCompat;->E(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    add-int/lit8 p2, p2, -0x1

    .line 51
    .line 52
    :goto_1
    if-ltz p2, :cond_3

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->K(Landroidx/preference/Preference;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_2

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->e1(Landroidx/preference/Preference;)Z

    .line 65
    .line 66
    .line 67
    :cond_2
    add-int/lit8 p2, p2, -0x1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    invoke-static {}, Lcom/android/launcher3/y0;->p0()Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-eqz p2, :cond_5

    .line 75
    .line 76
    iget-object p2, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->r:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz p2, :cond_5

    .line 79
    .line 80
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->L(Ljava/lang/String;Landroidx/preference/PreferenceGroup;)Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-nez p2, :cond_5

    .line 85
    .line 86
    iget-object p2, p0, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->r:Ljava/lang/String;

    .line 87
    .line 88
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/settings/SettingsActivity$LauncherSettingsFragment;->J(Landroidx/preference/PreferenceScreen;Ljava/lang/String;)Landroidx/preference/PreferenceScreen;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    if-eqz p1, :cond_5

    .line 93
    .line 94
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    if-eqz p2, :cond_5

    .line 99
    .line 100
    invoke-virtual {p1}, Landroidx/preference/Preference;->I()Ljava/lang/CharSequence;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-nez p2, :cond_4

    .line 109
    .line 110
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-virtual {p1}, Landroidx/preference/Preference;->I()Ljava/lang/CharSequence;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p2, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    :cond_4
    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->D(Landroidx/preference/PreferenceScreen;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_5
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    if-eqz p1, :cond_6

    .line 130
    .line 131
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1}, Landroidx/preference/Preference;->I()Ljava/lang/CharSequence;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-nez p1, :cond_6

    .line 144
    .line 145
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0}, Landroidx/preference/Preference;->I()Ljava/lang/CharSequence;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {p1, p0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    :cond_6
    return-void
.end method
