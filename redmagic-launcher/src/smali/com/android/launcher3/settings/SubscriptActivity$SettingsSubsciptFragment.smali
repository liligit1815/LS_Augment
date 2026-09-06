.class public Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;
.super Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;
.source "SubscriptActivity.java"

# interfaces
.implements Landroidx/preference/Preference$d;
.implements Landroidx/preference/Preference$e;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x17
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/settings/SubscriptActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SettingsSubsciptFragment"
.end annotation


# instance fields
.field private r:J

.field private s:Landroid/app/Dialog;

.field private t:Lcom/android/launcher3/settings/SubscriptActivity$a;

.field private u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/H5$k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/zte/mifavor/androidx/preference/PreferenceFragmentCompat;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->r:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->t:Lcom/android/launcher3/settings/SubscriptActivity$a;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic G(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic I(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;)Lcom/android/launcher3/settings/SubscriptActivity$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->t:Lcom/android/launcher3/settings/SubscriptActivity$a;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic J(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->X(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic K(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->d0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private L()Z
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->r:J

    .line 6
    .line 7
    sub-long/2addr v2, v0

    .line 8
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    const-wide/16 v4, 0x12c

    .line 13
    .line 14
    cmp-long v2, v2, v4

    .line 15
    .line 16
    if-lez v2, :cond_0

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->r:J

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method private M(Lcom/android/launcher3/H5$k;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/H5$k;->a()Landroid/content/ComponentName;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v0, "#"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1}, Lcom/android/launcher3/H5$k;->d()Landroid/os/UserHandle;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method private N(Ljava/lang/String;)Lcom/android/launcher3/H5$k;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->u:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/android/launcher3/H5$k;

    .line 18
    .line 19
    invoke-direct {p0, v1}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->M(Lcom/android/launcher3/H5$k;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    return-object v1

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method private declared-synchronized O(Landroid/content/Context;Lcom/android/launcher3/util/E;Z)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    new-instance v1, Landroid/content/Intent;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 21
    .line 22
    invoke-virtual {v2, v1, v3}, Ls1/P;->x0(Landroid/content/Intent;Landroid/os/UserHandle;)LI/d;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->j0()Lcom/android/launcher3/c1;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v2, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 37
    .line 38
    invoke-virtual {v0, p1, v1, v2}, Lcom/android/launcher3/c1;->s(Landroid/content/Context;Landroid/content/Intent;Landroid/os/UserHandle;)LI/d;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p1

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    :goto_0
    if-nez p3, :cond_1

    .line 46
    .line 47
    iget-object p1, v2, LI/d;->b:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p1, Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    monitor-exit p0

    .line 52
    return-object p1

    .line 53
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, v2, LI/d;->b:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v1, Landroid/graphics/Bitmap;

    .line 68
    .line 69
    invoke-static {p1, v1, v0, p3, p2}, Lcom/android/launcher3/c1;->h(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/android/launcher3/H5$c;ILcom/android/launcher3/util/E;)Landroid/graphics/Bitmap;

    .line 70
    .line 71
    .line 72
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    monitor-exit p0

    .line 74
    return-object p1

    .line 75
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 76
    throw p1
.end method

.method private P(Z)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/android/launcher3/H5$c;->h:Lcom/android/launcher3/H5$c;

    .line 14
    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const p1, 0x7f1403ca

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const p1, 0x7f1403c9

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    if-eqz p1, :cond_2

    .line 36
    .line 37
    const p1, 0x7f1403c8

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_2
    const p1, 0x7f1403c7

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method private synthetic T()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->isAdded()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-direct {p0, v0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->X(Z)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->Z(Z)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->Y()V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->b0()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p0, "SubscriptActivity"

    .line 22
    .line 23
    const-string v0, "initPreferencesList, no attach"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic U()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->p0()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->u:Ljava/util/List;

    .line 14
    .line 15
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 16
    .line 17
    new-instance v1, LK1/t;

    .line 18
    .line 19
    invoke-direct {v1, p0}, LK1/t;-><init>(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private V(Landroid/content/Context;Lcom/android/launcher3/util/E;Z)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->O(Landroid/content/Context;Lcom/android/launcher3/util/E;Z)Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Landroid/graphics/drawable/BitmapDrawable;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {p2, p0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 12
    .line 13
    .line 14
    return-object p2
.end method

.method private W(Ljava/lang/String;)Lcom/android/launcher3/util/E;
    .locals 3

    .line 1
    const-string p0, "#"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->i(I)Landroid/os/UserHandle;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p1, v2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v2, "parseKeyFromString -"

    .line 40
    .line 41
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v0, "-"

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v0, "SubscriptActivity"

    .line 60
    .line 61
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    new-instance p1, Lcom/android/launcher3/util/E;

    .line 65
    .line 66
    invoke-static {p0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-direct {p1, p0, v1}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 71
    .line 72
    .line 73
    return-object p1
.end method

.method private X(Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const v1, 0x7f1403b6

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p0, v1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const v3, 0x7f1403bf

    .line 35
    .line 36
    .line 37
    const v4, 0x7f1403c0

    .line 38
    .line 39
    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->Z:Z

    .line 55
    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    sget-object v2, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 59
    .line 60
    if-ne v0, v2, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0, v4}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    goto :goto_0

    .line 67
    :cond_0
    invoke-virtual {p0, v3}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    :goto_0
    invoke-virtual {v1, v0}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->a1(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_1
    sget-object v2, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 76
    .line 77
    if-ne v0, v2, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0, v4}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    goto :goto_1

    .line 84
    :cond_2
    invoke-virtual {p0, v3}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    :goto_1
    invoke-virtual {v1, v0}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->J0(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    :goto_2
    if-eqz p1, :cond_3

    .line 92
    .line 93
    invoke-virtual {v1, p0}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    .line 94
    .line 95
    .line 96
    :cond_3
    return-void
.end method

.method private Y()V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "refreshPreferencesList: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->u:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "SubscriptActivity"

    .line 25
    .line 26
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    const-string v0, "category_settings_preference_key_open"

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroidx/preference/PreferenceCategory;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->u:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Lcom/android/launcher3/H5$k;

    .line 54
    .line 55
    new-instance v3, Landroidx/preference/SwitchPreference;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-direct {v3, v4}, Landroidx/preference/SwitchPreference;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    invoke-direct {p0, v2}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->M(Lcom/android/launcher3/H5$k;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v3, v4}, Landroidx/preference/Preference;->B0(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v4, Lcom/android/launcher3/util/E;

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/android/launcher3/H5$k;->a()Landroid/content/ComponentName;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    invoke-virtual {v2}, Lcom/android/launcher3/H5$k;->d()Landroid/os/UserHandle;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-direct {v4, v5, v6}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v3}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2}, Lcom/android/launcher3/H5$k;->c()I

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    const/4 v6, 0x0

    .line 92
    const/4 v7, 0x1

    .line 93
    if-ne v5, v7, :cond_0

    .line 94
    .line 95
    move v5, v7

    .line 96
    goto :goto_1

    .line 97
    :cond_0
    move v5, v6

    .line 98
    :goto_1
    invoke-direct {p0, v5}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->P(Z)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-virtual {v3, v5}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Lcom/android/launcher3/H5$k;->b()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    invoke-virtual {v3, v5}, Landroidx/preference/Preference;->M0(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Lcom/android/launcher3/H5$k;->c()I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    if-ne v5, v7, :cond_1

    .line 117
    .line 118
    move v5, v7

    .line 119
    goto :goto_2

    .line 120
    :cond_1
    move v5, v6

    .line 121
    :goto_2
    invoke-virtual {v3, v5}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v5}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    invoke-virtual {v2}, Lcom/android/launcher3/H5$k;->c()I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-ne v2, v7, :cond_2

    .line 137
    .line 138
    move v6, v7

    .line 139
    :cond_2
    invoke-direct {p0, v5, v4, v6}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->V(Landroid/content/Context;Lcom/android/launcher3/util/E;Z)Landroid/graphics/drawable/Drawable;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v3, v2}, Landroidx/preference/Preference;->z0(Landroid/graphics/drawable/Drawable;)V

    .line 144
    .line 145
    .line 146
    const v2, 0x7f1403b5

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {v3, v2}, Landroidx/preference/Preference;->u0(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v3, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 157
    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_3
    return-void
.end method

.method private Z(Z)V
    .locals 3

    .line 1
    const v0, 0x7f1403b5

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroidx/preference/SwitchPreference;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/H5;->o0()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x1

    .line 27
    if-ne v2, v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v2, 0x0

    .line 31
    :goto_0
    invoke-virtual {v0, v2}, Landroidx/preference/TwoStatePreference;->V0(Z)V

    .line 32
    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Landroidx/preference/Preference;->E0(Landroidx/preference/Preference$d;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method private a0(Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->N(Ljava/lang/String;)Lcom/android/launcher3/H5$k;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Lcom/android/launcher3/util/E;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/H5$k;->a()Landroid/content/ComponentName;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/H5$k;->d()Landroid/os/UserHandle;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {v0, v1, p1}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0, p2}, Lcom/android/launcher3/H5;->j(Lcom/android/launcher3/util/E;I)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method private b0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->R0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "refreshZenStatus: "

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "SubscriptActivity"

    .line 31
    .line 32
    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-static {}, LK1/x;->f()LK1/x;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v1, p0, v0}, LK1/x;->e(Landroid/content/Context;Lcom/android/launcher3/C2;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method

.method private c0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->E0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lx1/h;

    .line 16
    .line 17
    invoke-direct {v0}, Lx1/h;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment$a;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment$a;-><init>(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Lx1/h;->a(Landroid/content/Context;Lx1/h$c;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->d0()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private d0()V
    .locals 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const v1, 0x7f1403c0

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const v2, 0x7f1403bf

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Lx1/e;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-direct {v2, v3}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    const v3, 0x7f1403be

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Lx1/e;->n(I)Lx1/e;

    .line 44
    .line 45
    .line 46
    new-instance v3, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment$b;

    .line 47
    .line 48
    invoke-direct {v3, p0, v0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment$b;-><init>(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;Lcom/android/launcher3/H5$c;)V

    .line 49
    .line 50
    .line 51
    const/4 v4, 0x0

    .line 52
    invoke-static {v3, v4}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    new-instance v5, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment$c;

    .line 57
    .line 58
    invoke-direct {v5, p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment$c;-><init>(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v5, v4}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    sget-object v5, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 66
    .line 67
    const/4 v6, 0x1

    .line 68
    if-ne v0, v5, :cond_0

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    move v0, v6

    .line 73
    :goto_0
    invoke-virtual {v2, v1, v0, v3}, Lx1/e;->m([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 74
    .line 75
    .line 76
    const/high16 v0, 0x1040000

    .line 77
    .line 78
    invoke-virtual {v2, v0, v4}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2, v6}, Lx1/e;->c(Z)Lx1/e;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2}, Lx1/e;->p()Landroid/app/Dialog;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->s:Landroid/app/Dialog;

    .line 89
    .line 90
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_1

    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->s:Landroid/app/Dialog;

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    const v2, 0x7f070ab2

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    const/4 v2, -0x2

    .line 114
    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V

    .line 115
    .line 116
    .line 117
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->s:Landroid/app/Dialog;

    .line 118
    .line 119
    invoke-virtual {v3, v0}, LK1/g;->b(Ljava/lang/Object;)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->s:Landroid/app/Dialog;

    .line 123
    .line 124
    invoke-virtual {v4, p0}, LK1/g;->b(Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method


# virtual methods
.method S(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->isResumed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/preference/PreferenceFragmentCompat;->r()Landroidx/preference/PreferenceScreen;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroidx/preference/PreferenceGroup;->d1()V

    .line 15
    .line 16
    .line 17
    const p1, 0x7f170017

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->l(I)V

    .line 21
    .line 22
    .line 23
    const-string p1, "category_settings_preference_key_open"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->c(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Landroidx/preference/PreferenceCategory;

    .line 30
    .line 31
    new-instance v0, Landroidx/preference/SwitchPreference;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, v1}, Landroidx/preference/SwitchPreference;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    const v1, 0x7f1403b5

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->B0(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const v1, 0x7f1403cd

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroidx/preference/Preference;->L0(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->V0(Landroidx/preference/Preference;)Z

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->u:Ljava/util/List;

    .line 60
    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 64
    .line 65
    .line 66
    :cond_1
    sget-object p1, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 67
    .line 68
    new-instance v0, LK1/s;

    .line 69
    .line 70
    invoke-direct {v0, p0}, LK1/s;-><init>(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public d(Landroidx/preference/Preference;Ljava/lang/Object;)Z
    .locals 4

    .line 1
    instance-of v0, p1, Landroidx/preference/SwitchPreference;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const v2, 0x7f1403b5

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v2}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, 0x1

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->o0()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-ne p1, v2, :cond_1

    .line 38
    .line 39
    move p1, v2

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move p1, v1

    .line 42
    :goto_0
    if-nez p2, :cond_2

    .line 43
    .line 44
    move p2, p1

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    check-cast p2, Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    :goto_1
    if-eq p1, p2, :cond_4

    .line 53
    .line 54
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v0, "onPreferenceChange: unread total switch status: "

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string v0, "SubscriptActivity"

    .line 72
    .line 73
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-virtual {p1, v0, p2}, Lcom/android/launcher3/H5;->j(Lcom/android/launcher3/util/E;I)Z

    .line 86
    .line 87
    .line 88
    invoke-direct {p0, v1}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->Z(Z)V

    .line 89
    .line 90
    .line 91
    if-eqz p2, :cond_4

    .line 92
    .line 93
    invoke-direct {p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->b0()V

    .line 94
    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_3
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast p2, Ljava/lang/Boolean;

    .line 102
    .line 103
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->a0(Ljava/lang/String;I)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-direct {p0, v0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->W(Ljava/lang/String;)Lcom/android/launcher3/util/E;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    if-eqz v0, :cond_4

    .line 119
    .line 120
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    invoke-direct {p0, v1, v0, v3}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->V(Landroid/content/Context;Lcom/android/launcher3/util/E;Z)Landroid/graphics/drawable/Drawable;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {p1, v0}, Landroidx/preference/Preference;->z0(Landroid/graphics/drawable/Drawable;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    invoke-direct {p0, p2}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->P(Z)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p1, p0}, Landroidx/preference/Preference;->J0(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    :cond_4
    :goto_2
    return v2
.end method

.method public f(Landroidx/preference/Preference;)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const v0, 0x7f1403b6

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->c0()V

    .line 25
    .line 26
    .line 27
    :cond_0
    const/4 p0, 0x1

    .line 28
    return p0
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
    .locals 1

    .line 1
    invoke-static {}, LK1/x;->f()LK1/x;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, LK1/x;->d()V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Landroidx/fragment/app/n;->onDestroy()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/n;->onResume()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->S(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->t:Lcom/android/launcher3/settings/SubscriptActivity$a;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/settings/SubscriptActivity$a;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/android/launcher3/settings/SubscriptActivity$a;-><init>(Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->t:Lcom/android/launcher3/settings/SubscriptActivity$a;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/preference/PreferenceFragmentCompat;->onStop()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->s:Landroid/app/Dialog;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->s:Landroid/app/Dialog;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/android/launcher3/settings/SubscriptActivity$SettingsSubsciptFragment;->s:Landroid/app/Dialog;

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, v1}, Lcom/android/launcher3/H5;->m1(Lcom/android/launcher3/H5$e;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public v(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 0

    .line 1
    const p1, 0x7f170017

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Landroidx/preference/PreferenceFragmentCompat;->l(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
