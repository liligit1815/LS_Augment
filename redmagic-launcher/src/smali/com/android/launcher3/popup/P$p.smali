.class public Lcom/android/launcher3/popup/P$p;
.super Lcom/android/launcher3/popup/P;
.source "SystemShortcut.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/P;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "p"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 8

    .line 1
    const-string v3, "shortcut_uninstall_bg"

    .line 2
    .line 3
    const v4, 0x7f140463

    .line 4
    .line 5
    .line 6
    const v1, 0x7f080d8b

    .line 7
    .line 8
    .line 9
    const-string v2, "unload"

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v5, p1

    .line 13
    move-object v6, p2

    .line 14
    move-object v7, p3

    .line 15
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/popup/P;-><init>(ILjava/lang/String;Ljava/lang/String;ILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J(Lcom/android/launcher3/popup/P$p;Landroid/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/popup/P$p;->P(Landroid/app/Dialog;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Lcom/android/launcher3/popup/P$p;Landroid/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/popup/P$p;->O(Landroid/app/Dialog;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L(Lcom/zte/mifavor/launcher/adapter/compat/c;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0x3e7

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private M(Landroid/app/Dialog;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-static {v0}, Lx1/O;->Q3(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    new-instance v1, Lcom/android/launcher3/popup/U;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/popup/U;-><init>(Lcom/android/launcher3/popup/P$p;Landroid/app/Dialog;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private N(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;
    .locals 2

    .line 1
    instance-of p0, p2, Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    check-cast p2, Lcom/android/launcher3/model/data/d;

    .line 7
    .line 8
    iget-object p0, p2, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    instance-of p0, p2, Lcom/android/launcher3/model/data/I;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    check-cast p2, Lcom/android/launcher3/model/data/I;

    .line 18
    .line 19
    iget p0, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    iget-object p0, p2, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 24
    .line 25
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move-object p0, v0

    .line 29
    move-object p2, p0

    .line 30
    :goto_0
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Landroid/content/pm/LauncherApps;

    .line 39
    .line 40
    invoke-virtual {p1, p0, p2}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-eqz p0, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 51
    .line 52
    and-int/lit8 p1, p1, 0x1

    .line 53
    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 61
    .line 62
    and-int/lit8 p1, p1, 0x1

    .line 63
    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Lcom/android/launcher3/util/J1;->l(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    :cond_2
    invoke-virtual {p0}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_3
    return-object v0
.end method

.method private synthetic O(Landroid/app/Dialog;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "disablePositiveButtonIfNecessary: disable uninstall button, item: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v0, "SystemShortcut"

    .line 21
    .line 22
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    check-cast p1, Lcom/zte/mifavor/widget/d;

    .line 26
    .line 27
    const/4 p0, -0x1

    .line 28
    invoke-virtual {p1, p0}, Lcom/zte/mifavor/widget/d;->getButton(I)Landroid/widget/Button;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic P(Landroid/app/Dialog;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-static {v0}, Lh2/c;->c(Landroid/content/Context;)Lh2/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lh2/c;->k()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lh2/c;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lh2/c;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void

    .line 30
    :cond_1
    :goto_0
    instance-of v0, p1, Lcom/zte/mifavor/widget/d;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 35
    .line 36
    new-instance v1, Lcom/android/launcher3/popup/V;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/popup/V;-><init>(Lcom/android/launcher3/popup/P$p;Landroid/app/Dialog;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method


# virtual methods
.method protected Q(Ljava/lang/String;Ljava/lang/String;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 8

    .line 1
    new-instance p2, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    instance-of v0, p4, Lcom/android/launcher3/BubbleTextView;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p4, Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p4, "SystemShortcut"

    .line 17
    .line 18
    const-string v0, "showUninstallRemindDialog, originalView type is error"

    .line 19
    .line 20
    invoke-static {p4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object p4, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    check-cast p4, Lcom/android/launcher3/C2;

    .line 26
    .line 27
    new-instance v0, Lx1/e;

    .line 28
    .line 29
    invoke-direct {v0, p4}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    const v1, 0x7f1400a0

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lx1/e;->n(I)Lx1/e;

    .line 36
    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-virtual {v0, v2}, Lx1/e;->l(Z)Lx1/e;

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lx1/c0;->d()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    const/4 v4, 0x0

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    if-eqz p3, :cond_1

    .line 50
    .line 51
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    if-eqz v3, :cond_1

    .line 66
    .line 67
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    const-string v5, "com.vertu.concierge"

    .line 80
    .line 81
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_1

    .line 86
    .line 87
    const p1, 0x7f1400a2

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, p1}, Lx1/e;->n(I)Lx1/e;

    .line 91
    .line 92
    .line 93
    const p1, 0x7f140466

    .line 94
    .line 95
    .line 96
    invoke-virtual {p4, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {v0, p1}, Lx1/e;->e(Ljava/lang/CharSequence;)Lx1/e;

    .line 101
    .line 102
    .line 103
    goto/16 :goto_3

    .line 104
    .line 105
    :cond_1
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    const/4 v5, 0x0

    .line 110
    if-eqz v3, :cond_2

    .line 111
    .line 112
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    new-instance v6, Lcom/android/launcher3/popup/T;

    .line 117
    .line 118
    invoke-direct {v6, v3, p3}, Lcom/android/launcher3/popup/T;-><init>(Lcom/zte/mifavor/launcher/adapter/compat/c;Lcom/android/launcher3/model/data/y;)V

    .line 119
    .line 120
    .line 121
    iget-object v7, p3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 122
    .line 123
    invoke-virtual {v3, v7}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    const/16 v7, 0x3e7

    .line 128
    .line 129
    if-eq v3, v7, :cond_2

    .line 130
    .line 131
    invoke-virtual {p4}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-static {v3}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-interface {v3, v6}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-eqz v3, :cond_2

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_2
    move v2, v5

    .line 155
    :goto_1
    invoke-static {p4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    const v6, 0x7f0e0250

    .line 160
    .line 161
    .line 162
    invoke-virtual {v3, v6, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    const v6, 0x7f0b0658

    .line 167
    .line 168
    .line 169
    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    check-cast v6, Landroid/widget/TextView;

    .line 174
    .line 175
    invoke-virtual {v6, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    .line 177
    .line 178
    const p1, 0x7f0b0657

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    check-cast p1, Landroid/widget/TextView;

    .line 186
    .line 187
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 188
    .line 189
    .line 190
    move-result-object p3

    .line 191
    invoke-static {p4, p3}, Lcom/android/launcher3/util/J1;->o(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 192
    .line 193
    .line 194
    move-result p3

    .line 195
    if-eqz p3, :cond_3

    .line 196
    .line 197
    const p3, 0x7f1403da

    .line 198
    .line 199
    .line 200
    invoke-virtual {p4, p3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p3

    .line 204
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    .line 206
    .line 207
    const p1, 0x7f1400a6

    .line 208
    .line 209
    .line 210
    invoke-virtual {p4, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    const p3, 0x7f0b0659

    .line 215
    .line 216
    .line 217
    invoke-virtual {v3, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 218
    .line 219
    .line 220
    move-result-object p3

    .line 221
    check-cast p3, Landroid/widget/TextView;

    .line 222
    .line 223
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 227
    .line 228
    .line 229
    goto :goto_2

    .line 230
    :cond_3
    if-eqz v2, :cond_4

    .line 231
    .line 232
    const p3, 0x7f1400aa

    .line 233
    .line 234
    .line 235
    invoke-virtual {p4, p3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p3

    .line 239
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 240
    .line 241
    .line 242
    goto :goto_2

    .line 243
    :cond_4
    const p3, 0x7f1400a8

    .line 244
    .line 245
    .line 246
    invoke-virtual {p4, p3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p3

    .line 250
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 251
    .line 252
    .line 253
    :goto_2
    const p1, 0x7f0b0656

    .line 254
    .line 255
    .line 256
    invoke-virtual {v3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    check-cast p1, Lcom/android/launcher3/uninstall/OverlapIconsView;

    .line 261
    .line 262
    invoke-virtual {p1, p2}, Lcom/android/launcher3/uninstall/OverlapIconsView;->setData(Ljava/util/ArrayList;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v0, v3}, Lx1/e;->o(Landroid/view/View;)Lx1/e;

    .line 266
    .line 267
    .line 268
    :goto_3
    new-instance p1, Lcom/android/launcher3/popup/P$p$a;

    .line 269
    .line 270
    invoke-direct {p1, p0, p4, p2}, Lcom/android/launcher3/popup/P$p$a;-><init>(Lcom/android/launcher3/popup/P$p;Lcom/android/launcher3/C2;Ljava/util/ArrayList;)V

    .line 271
    .line 272
    .line 273
    invoke-static {p1, v4}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    new-instance p2, Lcom/android/launcher3/popup/P$p$b;

    .line 278
    .line 279
    invoke-direct {p2, p0}, Lcom/android/launcher3/popup/P$p$b;-><init>(Lcom/android/launcher3/popup/P$p;)V

    .line 280
    .line 281
    .line 282
    invoke-static {p2, v4}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 283
    .line 284
    .line 285
    move-result-object p2

    .line 286
    invoke-virtual {p4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 287
    .line 288
    .line 289
    move-result-object p3

    .line 290
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p3

    .line 294
    invoke-virtual {v0, p3, p1}, Lx1/e;->k(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 295
    .line 296
    .line 297
    invoke-virtual {p4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 298
    .line 299
    .line 300
    move-result-object p3

    .line 301
    const p4, 0x7f14032f

    .line 302
    .line 303
    .line 304
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object p3

    .line 308
    invoke-virtual {v0, p3, p2}, Lx1/e;->g(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v0}, Lx1/e;->p()Landroid/app/Dialog;

    .line 312
    .line 313
    .line 314
    move-result-object p3

    .line 315
    invoke-virtual {p1, p3}, LK1/g;->b(Ljava/lang/Object;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {p2, p3}, LK1/g;->b(Ljava/lang/Object;)V

    .line 319
    .line 320
    .line 321
    invoke-direct {p0, p3}, Lcom/android/launcher3/popup/P$p;->M(Landroid/app/Dialog;)V

    .line 322
    .line 323
    .line 324
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 1
    const-string p1, "SystemShortcut"

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    check-cast v0, Lcom/android/launcher3/C2;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x2

    .line 9
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 13
    .line 14
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/popup/P$p;->N(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Landroid/content/ComponentName;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "com.zte.heartyservice"

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    .line 33
    .line 34
    const-string v3, "com.zte.heartyservice.intent.action.startActivity.UNINSTALL_NOTICE"

    .line 35
    .line 36
    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string v3, "UNINSTALL_FROM"

    .line 40
    .line 41
    const-string v4, "com.zte.mifavor.launcher"

    .line 42
    .line 43
    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    const-string v2, "start heartyService"

    .line 50
    .line 51
    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/android/launcher3/C2;->setHeartyServiceOriginalView(Landroid/view/View;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :catch_0
    const-string v0, "heartyService activity not found "

    .line 64
    .line 65
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const v0, 0x7f1402ec

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 84
    .line 85
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const v1, 0x7f1400a8

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 107
    .line 108
    iget-object v2, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 109
    .line 110
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/android/launcher3/popup/P$p;->Q(Ljava/lang/String;Ljava/lang/String;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 111
    .line 112
    .line 113
    :cond_1
    return-void
.end method
