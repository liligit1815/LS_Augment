.class public Lz1/h4;
.super Ljava/lang/Object;
.source "PackageUpdatedTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# static fields
.field private static final e:[Ljava/lang/String;


# instance fields
.field private final a:I

.field private final b:Landroid/os/UserHandle;

.field private final c:[Ljava/lang/String;

.field d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "com.google.android.calendar"

    .line 2
    .line 3
    const-string v1, "com.android.calendar"

    .line 4
    .line 5
    const-string v2, "zte.com.cn.alarmclock"

    .line 6
    .line 7
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lz1/h4;->e:[Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public varargs constructor <init>(ILandroid/os/UserHandle;[Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lz1/h4;->d:Ljava/util/ArrayList;

    .line 6
    .line 7
    iput p1, p0, Lz1/h4;->a:I

    .line 8
    .line 9
    iput-object p2, p0, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 10
    .line 11
    iput-object p3, p0, Lz1/h4;->c:[Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b(Lz1/h4;Ljava/util/function/Predicate;Lcom/android/launcher3/util/z0;Lz1/m;Lcom/android/launcher3/util/z0;ZLandroid/content/Context;Ljava/util/HashSet;Ljava/util/ArrayList;Ljava/util/HashMap;Ls1/P;Lcom/android/launcher3/util/p0;Lcom/android/launcher3/P2;Ljava/util/ArrayList;Lz1/o3;Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p15}, Lz1/h4;->m(Ljava/util/function/Predicate;Lcom/android/launcher3/util/z0;Lz1/m;Lcom/android/launcher3/util/z0;ZLandroid/content/Context;Ljava/util/HashSet;Ljava/util/ArrayList;Ljava/util/HashMap;Ls1/P;Lcom/android/launcher3/util/p0;Lcom/android/launcher3/P2;Ljava/util/ArrayList;Lz1/o3;Lcom/android/launcher3/model/data/I;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/model/data/A;
    .locals 0

    .line 1
    check-cast p0, Lcom/android/launcher3/model/data/A;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lz1/h4;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lz1/h4;->n(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic e(Ljava/util/ArrayList;Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static synthetic f(Ljava/util/HashSet;Lcom/android/launcher3/model/data/A;)Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p1, p1, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

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

.method public static synthetic g(Ljava/util/HashSet;Lcom/android/launcher3/model/data/d;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "OP_UPDATE - AllAppsList.trackRemoves callback: removed component="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " id="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, " Look for earlier AllAppsList logs to find more information."

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "PackageUpdatedTask"

    .line 36
    .line 37
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    iget-object p1, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic h(Lz1/h4;Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/h4;->p(Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ljava/util/ArrayList;Lz1/o3;Lcom/android/launcher3/model/data/A;)V
    .locals 1

    .line 1
    iget v0, p2, Lcom/android/launcher3/model/data/A;->i:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, -0xb

    .line 4
    .line 5
    or-int/lit8 v0, v0, 0x4

    .line 6
    .line 7
    iput v0, p2, Lcom/android/launcher3/model/data/A;->i:I

    .line 8
    .line 9
    const/16 v0, 0x64

    .line 10
    .line 11
    iput v0, p2, Lcom/android/launcher3/model/data/A;->j:I

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lz1/o3;->Y()Lz1/J3;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, p2}, Lz1/J3;->b0(Lcom/android/launcher3/model/data/y;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic j(Ljava/lang/String;Lcom/android/launcher3/model/data/d;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public static synthetic k(Lz1/h4;ILz1/y0;[Ljava/lang/String;Lz1/o3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lz1/h4;->o(ILz1/y0;[Ljava/lang/String;Lz1/o3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Lz1/h4;->a:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string p0, "UNKNOWN"

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_0
    const-string p0, "USER_AVAILABILITY_CHANGE"

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_1
    const-string p0, "UNSUSPEND"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_2
    const-string p0, "SUSPEND"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_3
    const-string p0, "UNAVAILABLE"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_4
    const-string p0, "REMOVE"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_5
    const-string p0, "UPDATE"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_6
    const-string p0, "ADD"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_7
    const-string p0, "NONE"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private synthetic m(Ljava/util/function/Predicate;Lcom/android/launcher3/util/z0;Lz1/m;Lcom/android/launcher3/util/z0;ZLandroid/content/Context;Ljava/util/HashSet;Ljava/util/ArrayList;Ljava/util/HashMap;Ls1/P;Lcom/android/launcher3/util/p0;Lcom/android/launcher3/P2;Ljava/util/ArrayList;Lz1/o3;Lcom/android/launcher3/model/data/I;)V
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v2, p4

    move-object/from16 v3, p6

    move-object/from16 v4, p15

    .line 1
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v0

    const/4 v5, 0x0

    if-eqz v0, :cond_13

    move-object/from16 v6, p1

    .line 2
    invoke-interface {v6, v4}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13

    .line 3
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/16 v0, 0x8

    .line 4
    invoke-virtual {v4, v0}, Lcom/android/launcher3/model/data/I;->Z(I)Z

    move-result v0

    const/4 v7, 0x3

    if-eqz v0, :cond_0

    .line 5
    iget v0, v4, Lcom/android/launcher3/model/data/y;->id:I

    move-object/from16 v8, p2

    invoke-virtual {v8, v0}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 6
    iget v0, v1, Lz1/h4;->a:I

    if-ne v0, v7, :cond_0

    goto/16 :goto_8

    .line 7
    :cond_0
    iget-object v0, v1, Lz1/h4;->c:[Ljava/lang/String;

    move-object/from16 v8, p3

    invoke-direct {v1, v0, v4, v8}, Lz1/h4;->u([Ljava/lang/String;Lcom/android/launcher3/model/data/I;Lz1/m;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 8
    iget v0, v4, Lcom/android/launcher3/model/data/y;->id:I

    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 9
    :cond_1
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    move-result-object v0

    .line 10
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/I;->b0()Z

    move-result v8

    const/4 v9, 0x2

    const/4 v10, 0x1

    if-eqz v8, :cond_a

    if-eqz p5, :cond_a

    .line 11
    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v8

    const-string v11, "."

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    xor-int/lit8 v11, v8, 0x1

    .line 12
    iget v12, v4, Lcom/android/launcher3/model/data/y;->itemType:I

    const/4 v13, 0x6

    const-string v14, ", isArchived="

    const-string v15, "PackageUpdatedTask"

    if-ne v12, v13, :cond_4

    .line 13
    invoke-static {}, Lcom/android/launcher3/y0;->D0()Z

    move-result v8

    if-eqz v8, :cond_2

    const/16 v8, 0xb

    goto :goto_0

    :cond_2
    move v8, v9

    .line 14
    :goto_0
    new-instance v12, LN1/f;

    iget-object v13, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    invoke-direct {v12, v3, v13}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 15
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 16
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    move-result-object v13

    filled-new-array {v13}, [Ljava/lang/String;

    move-result-object v13

    .line 17
    invoke-virtual {v12, v0, v13}, LN1/f;->c(Ljava/lang/String;[Ljava/lang/String;)LN1/f;

    move-result-object v0

    .line 18
    invoke-virtual {v0, v8}, LN1/f;->d(I)LN1/f$a;

    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Shortcut not found for updated package="

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->A()Z

    move-result v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 23
    invoke-static {v15, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 24
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Found shortcut for updated package="

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, ", isTargetValid="

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->A()Z

    move-result v12

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 27
    invoke-static {v15, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ShortcutInfo;

    invoke-virtual {v4, v0, v3}, Lcom/android/launcher3/model/data/I;->i0(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    move v0, v10

    goto :goto_2

    :cond_4
    if-nez v8, :cond_5

    .line 29
    :try_start_0
    const-class v8, Landroid/content/pm/LauncherApps;

    invoke-virtual {v3, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/pm/LauncherApps;

    iget-object v11, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 30
    invoke-virtual {v8, v0, v11}, Landroid/content/pm/LauncherApps;->isActivityEnabled(Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    move-result v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_5
    move v0, v5

    goto :goto_2

    :catch_0
    move-exception v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    move v0, v5

    move v11, v0

    :goto_2
    if-nez v11, :cond_8

    .line 32
    invoke-virtual {v4, v7}, Lcom/android/launcher3/model/data/I;->Z(I)Z

    move-result v7

    if-nez v7, :cond_6

    .line 33
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->A()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-virtual {v4}, Lcom/android/launcher3/model/data/I;->W()I

    move-result v7

    if-nez v7, :cond_8

    .line 34
    :cond_6
    invoke-direct {v1, v3, v4, v6}, Lz1/h4;->z(Landroid/content/Context;Lcom/android/launcher3/model/data/I;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    goto/16 :goto_3

    .line 35
    :cond_7
    invoke-direct {v1, v4}, Lz1/h4;->t(Lcom/android/launcher3/model/data/I;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 36
    iget v0, v4, Lcom/android/launcher3/model/data/y;->id:I

    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Removing restored shortcut promise icon that no longer points to valid component. id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v4, Lcom/android/launcher3/model/data/y;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", package="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v4, Lcom/android/launcher3/model/data/I;->m:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->A()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 40
    invoke-static {v15, v0}, Lcom/android/launcher3/logging/b;->o(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_8
    if-nez v11, :cond_9

    .line 41
    iget v0, v4, Lcom/android/launcher3/model/data/y;->id:I

    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Removing shortcut that no longer points to valid component. id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v4, Lcom/android/launcher3/model/data/y;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " package="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v4, Lcom/android/launcher3/model/data/I;->m:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 44
    invoke-static {v15, v0}, Lcom/android/launcher3/logging/b;->o(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 45
    :cond_9
    iput v5, v4, Lcom/android/launcher3/model/data/I;->m:I

    goto :goto_3

    :cond_a
    if-eqz p5, :cond_b

    move-object/from16 v2, p7

    .line 46
    invoke-virtual {v2, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    move-object/from16 v0, p8

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 47
    invoke-direct {v1, v3, v4, v6}, Lz1/h4;->z(Landroid/content/Context;Lcom/android/launcher3/model/data/I;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    :goto_3
    move v0, v10

    goto :goto_4

    :cond_b
    move v0, v5

    :cond_c
    :goto_4
    if-eqz p5, :cond_11

    move-object/from16 v2, p9

    .line 48
    invoke-virtual {v2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_e

    .line 49
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_d

    goto :goto_5

    .line 50
    :cond_d
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/pm/LauncherActivityInfo;

    .line 51
    invoke-static {v6}, Lcom/android/launcher3/util/J1;->f(Landroid/content/pm/LauncherActivityInfo;)I

    move-result v6

    goto :goto_6

    :cond_e
    :goto_5
    const/16 v6, 0x64

    .line 52
    :goto_6
    invoke-virtual {v4, v6, v9}, Lcom/android/launcher3/model/data/z;->J(II)V

    .line 53
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    move-result v6

    if-eqz v6, :cond_f

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_f

    .line 54
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/pm/LauncherActivityInfo;

    .line 55
    invoke-virtual {v6}, Landroid/content/pm/LauncherActivityInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    move-result-object v6

    iget-boolean v6, v6, Landroid/content/pm/ActivityInfo;->isArchived:Z

    .line 56
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->A()Z

    move-result v7

    if-eq v6, v7, :cond_f

    .line 57
    iget v0, v4, Lcom/android/launcher3/model/data/z;->h:I

    xor-int/lit16 v0, v0, 0x4000

    iput v0, v4, Lcom/android/launcher3/model/data/z;->h:I

    move v0, v10

    .line 58
    :cond_f
    iget v6, v4, Lcom/android/launcher3/model/data/y;->itemType:I

    if-nez v6, :cond_11

    if-eqz v2, :cond_10

    .line 59
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10

    .line 60
    sget-object v0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    invoke-virtual {v0, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher3/util/f;

    .line 61
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/LauncherActivityInfo;

    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/f;->l(Landroid/content/pm/LauncherActivityInfo;)Z

    move-result v0

    .line 62
    invoke-virtual {v4, v0}, Lcom/android/launcher3/model/data/z;->I(Z)V

    .line 63
    :cond_10
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    move-result-object v0

    move-object/from16 v2, p10

    .line 64
    invoke-virtual {v2, v4, v0}, Ls1/P;->H0(Lcom/android/launcher3/model/data/z;Lt1/g;)V

    move v0, v10

    .line 65
    :cond_11
    iget v2, v4, Lcom/android/launcher3/model/data/z;->h:I

    move-object/from16 v3, p11

    .line 66
    invoke-interface {v3, v2}, Lcom/android/launcher3/util/p0;->apply(I)I

    move-result v3

    iput v3, v4, Lcom/android/launcher3/model/data/z;->h:I

    if-eq v3, v2, :cond_12

    move v5, v10

    :cond_12
    move-object/from16 v2, p12

    .line 67
    invoke-direct {v1, v2, v4}, Lz1/h4;->x(Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V

    move/from16 v16, v5

    move v5, v0

    move/from16 v0, v16

    goto :goto_7

    :cond_13
    move v0, v5

    :goto_7
    if-nez v5, :cond_14

    if-eqz v0, :cond_15

    :cond_14
    move-object/from16 v1, p13

    .line 68
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_15
    if-eqz v5, :cond_16

    .line 69
    iget v0, v4, Lcom/android/launcher3/model/data/y;->id:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_16

    .line 70
    invoke-virtual/range {p14 .. p14}, Lz1/o3;->Y()Lz1/J3;

    move-result-object v0

    invoke-virtual {v0, v4}, Lz1/J3;->b0(Lcom/android/launcher3/model/data/y;)V

    :cond_16
    :goto_8
    return-void
.end method

.method private synthetic n(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private synthetic o(ILz1/y0;[Ljava/lang/String;Lz1/o3;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, p1, :cond_0

    .line 8
    .line 9
    iget-object v2, p2, Lz1/y0;->d:Lz1/u5;

    .line 10
    .line 11
    new-instance v3, Lcom/android/launcher3/util/L1;

    .line 12
    .line 13
    aget-object v4, p3, v1

    .line 14
    .line 15
    iget-object v5, p0, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 16
    .line 17
    invoke-direct {v3, v4, v5}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v3}, Lz1/u5;->v(Lcom/android/launcher3/util/L1;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    aget-object v2, p3, v1

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v2, ","

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p4, p2}, Lz1/o3;->E(Lz1/y0;)V

    .line 37
    .line 38
    .line 39
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string p2, "execute: update widgets: "

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget p0, p0, Lz1/h4;->a:I

    .line 50
    .line 51
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p0, ", "

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string p1, "PackageUpdatedTask"

    .line 71
    .line 72
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private synthetic p(Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lz1/h4;->x(Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private q(Lz1/o3;I[Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    const/4 v2, 0x2

    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v4

    .line 12
    const/4 v5, 0x1

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    if-eq p2, v5, :cond_0

    .line 16
    .line 17
    if-eq p2, v2, :cond_0

    .line 18
    .line 19
    if-ne p2, v1, :cond_3

    .line 20
    .line 21
    :cond_0
    array-length v0, p3

    .line 22
    new-array v0, v0, [Ljava/lang/String;

    .line 23
    .line 24
    move v6, v3

    .line 25
    move v7, v6

    .line 26
    :goto_0
    array-length v8, p3

    .line 27
    if-ge v6, v8, :cond_2

    .line 28
    .line 29
    if-ne p2, v2, :cond_1

    .line 30
    .line 31
    sget-object v8, Lz1/h4;->e:[Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    aget-object v9, p3, v6

    .line 38
    .line 39
    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    if-eqz v8, :cond_1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    add-int/lit8 v8, v7, 0x1

    .line 47
    .line 48
    aget-object v9, p3, v6

    .line 49
    .line 50
    aput-object v9, v0, v7

    .line 51
    .line 52
    move v7, v8

    .line 53
    :goto_1
    add-int/lit8 v6, v6, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    new-array v6, v7, [Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v0, v3, v6, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v7, p0, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 70
    .line 71
    invoke-interface {v0, v7, p2, v6}, Lcom/android/launcher3/globalsearch/s;->a(Landroid/os/UserHandle;I[Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    if-eq p2, v5, :cond_4

    .line 75
    .line 76
    if-ne p2, v1, :cond_5

    .line 77
    .line 78
    :cond_4
    invoke-static {v5}, Lx1/O;->n3(Z)Z

    .line 79
    .line 80
    .line 81
    :cond_5
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object p0, p0, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 94
    .line 95
    invoke-virtual {v0, p0, p2, p3}, Lcom/android/launcher3/H5;->Z0(Landroid/os/UserHandle;I[Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    if-eq p2, v5, :cond_6

    .line 99
    .line 100
    if-eq p2, v1, :cond_6

    .line 101
    .line 102
    if-ne p2, v2, :cond_10

    .line 103
    .line 104
    :cond_6
    if-eqz p3, :cond_10

    .line 105
    .line 106
    array-length p0, p3

    .line 107
    if-lez p0, :cond_10

    .line 108
    .line 109
    new-instance p0, Ljava/util/HashMap;

    .line 110
    .line 111
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 112
    .line 113
    .line 114
    if-ne p2, v5, :cond_8

    .line 115
    .line 116
    array-length p2, p3

    .line 117
    move v0, v3

    .line 118
    :goto_2
    if-ge v0, p2, :cond_d

    .line 119
    .line 120
    aget-object v1, p3, v0

    .line 121
    .line 122
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-nez v2, :cond_7

    .line 127
    .line 128
    invoke-virtual {p0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    :cond_7
    add-int/lit8 v0, v0, 0x1

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_8
    const/16 v0, 0x8

    .line 135
    .line 136
    if-ne p2, v1, :cond_a

    .line 137
    .line 138
    array-length p2, p3

    .line 139
    move v1, v3

    .line 140
    :goto_3
    if-ge v1, p2, :cond_d

    .line 141
    .line 142
    aget-object v2, p3, v1

    .line 143
    .line 144
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    if-nez v4, :cond_9

    .line 149
    .line 150
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    invoke-virtual {p0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    :cond_9
    add-int/lit8 v1, v1, 0x1

    .line 158
    .line 159
    goto :goto_3

    .line 160
    :cond_a
    if-ne p2, v2, :cond_d

    .line 161
    .line 162
    array-length p2, p3

    .line 163
    move v1, v3

    .line 164
    :goto_4
    if-ge v1, p2, :cond_d

    .line 165
    .line 166
    aget-object v2, p3, v1

    .line 167
    .line 168
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    if-nez v5, :cond_c

    .line 173
    .line 174
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    invoke-static {v5, v2}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v5

    .line 182
    if-eqz v5, :cond_b

    .line 183
    .line 184
    invoke-virtual {p0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    goto :goto_5

    .line 188
    :cond_b
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    invoke-virtual {p0, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    :cond_c
    :goto_5
    add-int/lit8 v1, v1, 0x1

    .line 196
    .line 197
    goto :goto_4

    .line 198
    :cond_d
    invoke-virtual {p1, p0}, Lz1/o3;->d0(Ljava/util/HashMap;)V

    .line 199
    .line 200
    .line 201
    invoke-static {}, Lx1/O;->k1()Z

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    if-eqz p0, :cond_10

    .line 206
    .line 207
    array-length p0, p3

    .line 208
    :goto_6
    if-ge v3, p0, :cond_10

    .line 209
    .line 210
    aget-object p1, p3, v3

    .line 211
    .line 212
    const-string p2, "com.zte.mifavorpad.weather"

    .line 213
    .line 214
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p2

    .line 218
    if-nez p2, :cond_f

    .line 219
    .line 220
    const-string p2, "com.zte.weather"

    .line 221
    .line 222
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    if-eqz p1, :cond_e

    .line 227
    .line 228
    goto :goto_7

    .line 229
    :cond_e
    add-int/lit8 v3, v3, 0x1

    .line 230
    .line 231
    goto :goto_6

    .line 232
    :cond_f
    :goto_7
    invoke-static {}, La1/d;->v()V

    .line 233
    .line 234
    .line 235
    :cond_10
    return-void
.end method

.method private r(Lcom/android/launcher3/P2;Lcom/android/launcher3/util/z0;)V
    .locals 2

    .line 1
    iget v0, p0, Lz1/h4;->a:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lz1/h4;->d:Ljava/util/ArrayList;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    iget-object p2, p0, Lz1/h4;->d:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/android/launcher3/model/data/d;

    .line 39
    .line 40
    invoke-direct {p0, p1, v0}, Lz1/h4;->x(Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method

.method private s(Lcom/android/launcher3/P2;Lz1/y0;Ljava/lang/String;)V
    .locals 2

    .line 1
    monitor-enter p2

    .line 2
    :try_start_0
    new-instance v0, Ljava/util/HashSet;

    .line 3
    .line 4
    filled-new-array {p3}, [Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-direct {v0, p3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/android/launcher3/util/P0;->t(Ljava/util/Set;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p3, p2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 22
    .line 23
    invoke-interface {p3}, Ljava/lang/Iterable;->spliterator()Ljava/util/Spliterator;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-static {p3, v0}, Ljava/util/stream/StreamSupport;->stream(Ljava/util/Spliterator;Z)Ljava/util/stream/Stream;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-interface {p3, p0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    invoke-interface {p0, p3}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ljava/util/Collection;

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    if-eqz p3, :cond_0

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    check-cast p3, Lcom/android/launcher3/model/data/y;

    .line 61
    .line 62
    new-instance v0, Lcom/android/launcher3/H5$a;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-direct {v0, v1, p3}, Lcom/android/launcher3/H5$a;-><init>(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    invoke-virtual {p3, v0}, Lcom/android/launcher3/H5;->k1(Lcom/android/launcher3/H5$a;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    goto :goto_1

    .line 81
    :cond_0
    monitor-exit p2

    .line 82
    return-void

    .line 83
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    throw p0
.end method

.method private t(Lcom/android/launcher3/model/data/I;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->Y()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/android/launcher3/y0;->D0()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->D0()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    iget p0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 28
    .line 29
    const/4 p1, 0x6

    .line 30
    if-ne p0, p1, :cond_1

    .line 31
    .line 32
    return v0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method private u([Ljava/lang/String;Lcom/android/launcher3/model/data/I;Lz1/m;)Z
    .locals 7

    .line 1
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->W()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_4

    .line 7
    .line 8
    const/16 p0, 0x64

    .line 9
    .line 10
    invoke-virtual {p2, p0}, Lcom/android/launcher3/model/data/I;->d0(I)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Lcom/android/launcher3/model/data/I;->f0(Ljava/lang/Boolean;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    iput-boolean p0, p2, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 20
    .line 21
    array-length v1, p1

    .line 22
    move v2, v0

    .line 23
    :goto_0
    const/4 v3, 0x3

    .line 24
    if-ge v2, v1, :cond_3

    .line 25
    .line 26
    aget-object v4, p1, v2

    .line 27
    .line 28
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-eqz v5, :cond_0

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-eqz v5, :cond_2

    .line 48
    .line 49
    iget-object v5, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 50
    .line 51
    invoke-virtual {p3, v4, v5}, Lz1/m;->l(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/d;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    if-eqz v4, :cond_1

    .line 56
    .line 57
    iget-object v5, v4, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 58
    .line 59
    if-eqz v5, :cond_1

    .line 60
    .line 61
    iput-object v5, p2, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 62
    .line 63
    new-instance v5, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v6, "animApp.intent: "

    .line 69
    .line 70
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget-object v4, v4, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 74
    .line 75
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    const-string v5, "PackageUpdatedTask"

    .line 83
    .line 84
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    :cond_1
    invoke-virtual {p2, v3}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 88
    .line 89
    .line 90
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->W()I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eq p1, v3, :cond_4

    .line 98
    .line 99
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->Y()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_4

    .line 104
    .line 105
    return p0

    .line 106
    :cond_4
    return v0
.end method

.method private v(Lcom/android/launcher3/P2;Lz1/y0;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 12
    .line 13
    iget-object v1, p0, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 14
    .line 15
    invoke-virtual {v0, p3, v1}, Landroid/content/pm/LauncherApps;->isPackageEnabled(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-direct {p0, p1, p2, p3}, Lz1/h4;->s(Lcom/android/launcher3/P2;Lz1/y0;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {p3}, Lx1/O;->r3(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lz1/h4;->s(Lcom/android/launcher3/P2;Lz1/y0;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string p1, "We don\'t saveAppLocation::  "

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "PackageUpdatedTask"

    .line 53
    .line 54
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private w(Lcom/android/launcher3/P2;Ljava/util/HashSet;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/P2;",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 29
    .line 30
    invoke-static {v1, v0, v2}, Lcom/android/launcher3/c1;->i(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1, v0}, Lcom/android/launcher3/X0;->u(Landroid/content/Context;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method private x(Lcom/android/launcher3/P2;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 21
    .line 22
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/util/D1;->f(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    iput-boolean p0, p2, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 27
    .line 28
    new-instance p0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string p1, "itemInfo: "

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p1, " isNewApp: "

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-boolean p1, p2, Lcom/android/launcher3/model/data/y;->isNewApp:Z

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "PackageUpdatedTask"

    .line 64
    .line 65
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private y(Lcom/android/launcher3/P2;Lz1/m;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lz1/h4;->d:Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v0, p0, Lz1/h4;->c:[Ljava/lang/String;

    .line 9
    .line 10
    array-length v1, v0

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v1, :cond_2

    .line 13
    .line 14
    aget-object v3, v0, v2

    .line 15
    .line 16
    iget-object v4, p0, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 17
    .line 18
    invoke-virtual {p2, v3, v4}, Lz1/m;->n(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-nez v4, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    iget-object v4, p0, Lz1/h4;->d:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    new-instance v4, Lz1/X3;

    .line 37
    .line 38
    invoke-direct {v4, p0, p1}, Lz1/X3;-><init>(Lz1/h4;Lcom/android/launcher3/P2;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {v3, v4}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method private z(Landroid/content/Context;Lcom/android/launcher3/model/data/I;Ljava/lang/String;)Z
    .locals 3

    .line 1
    iget v0, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return v2

    .line 8
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/J1;->d:Lcom/android/launcher3/util/I;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/android/launcher3/util/J1;

    .line 15
    .line 16
    iget-object p0, p0, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 17
    .line 18
    invoke-virtual {p1, p3, p0}, Lcom/android/launcher3/util/J1;->d(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    iput-object p0, p2, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 25
    .line 26
    iput v2, p2, Lcom/android/launcher3/model/data/I;->m:I

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    return v2
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 34

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v15, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v4, p3

    .line 8
    .line 9
    invoke-virtual {v15}, Lz1/o3;->V()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v7

    .line 13
    invoke-virtual {v15}, Lz1/o3;->W()Ls1/P;

    .line 14
    .line 15
    .line 16
    move-result-object v11

    .line 17
    invoke-static {}, Lcom/android/launcher3/resource/g;->l()Lcom/android/launcher3/resource/g;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v3, v1, Lz1/h4;->c:[Ljava/lang/String;

    .line 22
    .line 23
    array-length v5, v3

    .line 24
    new-instance v6, Ljava/util/HashSet;

    .line 25
    .line 26
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v8

    .line 30
    invoke-direct {v6, v8}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 31
    .line 32
    .line 33
    iget v8, v1, Lz1/h4;->a:I

    .line 34
    .line 35
    const/4 v9, 0x7

    .line 36
    if-ne v8, v9, :cond_0

    .line 37
    .line 38
    iget-object v8, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 39
    .line 40
    invoke-static {v8}, Lcom/android/launcher3/util/P0;->y(Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 41
    .line 42
    .line 43
    move-result-object v8

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object v8, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 46
    .line 47
    invoke-static {v6, v8}, Lcom/android/launcher3/util/P0;->t(Ljava/util/Set;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    :goto_0
    new-instance v9, Ljava/util/HashSet;

    .line 52
    .line 53
    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 54
    .line 55
    .line 56
    new-instance v10, Ljava/util/HashMap;

    .line 57
    .line 58
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 59
    .line 60
    .line 61
    new-instance v12, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v13, "PackageUpdatedTask"

    .line 67
    .line 68
    new-instance v14, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    move-object/from16 v16, v3

    .line 74
    .line 75
    const-string v3, "Package updated: mOp="

    .line 76
    .line 77
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-direct {v1}, Lz1/h4;->l()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v3, " packages="

    .line 88
    .line 89
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-static/range {v16 .. v16}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v3, ", user="

    .line 100
    .line 101
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget-object v3, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 105
    .line 106
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-static {v13, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    iget v3, v1, Lz1/h4;->a:I

    .line 117
    .line 118
    packed-switch v3, :pswitch_data_0

    .line 119
    .line 120
    .line 121
    sget-object v0, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 122
    .line 123
    :goto_1
    const/4 v3, 0x2

    .line 124
    goto/16 :goto_c

    .line 125
    .line 126
    :pswitch_0
    new-instance v0, Lz1/L4;

    .line 127
    .line 128
    invoke-direct {v0}, Lz1/L4;-><init>()V

    .line 129
    .line 130
    .line 131
    const-class v3, Landroid/os/UserManager;

    .line 132
    .line 133
    invoke-virtual {v7, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    check-cast v3, Landroid/os/UserManager;

    .line 138
    .line 139
    sget-object v14, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 140
    .line 141
    invoke-virtual {v14, v7}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v14

    .line 145
    check-cast v14, LD1/t;

    .line 146
    .line 147
    invoke-virtual {v0, v14, v3}, Lz1/L4;->a(LD1/t;Landroid/os/UserManager;)V

    .line 148
    .line 149
    .line 150
    iget-object v3, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 151
    .line 152
    invoke-virtual {v0, v3}, Lz1/L4;->d(Landroid/os/UserHandle;)Z

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    sget-object v14, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 157
    .line 158
    const/16 v13, 0x8

    .line 159
    .line 160
    invoke-interface {v14, v13, v3}, Lcom/android/launcher3/util/p0;->d(IZ)Lcom/android/launcher3/util/p0;

    .line 161
    .line 162
    .line 163
    move-result-object v14

    .line 164
    invoke-virtual {v4, v8, v14}, Lz1/m;->x(Ljava/util/function/Predicate;Lcom/android/launcher3/util/p0;)V

    .line 165
    .line 166
    .line 167
    invoke-static {}, Lcom/android/launcher3/y0;->O()Z

    .line 168
    .line 169
    .line 170
    move-result v20

    .line 171
    if-eqz v20, :cond_2

    .line 172
    .line 173
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 174
    .line 175
    invoke-virtual {v0, v7}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, LD1/t;

    .line 180
    .line 181
    iget-object v13, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 182
    .line 183
    invoke-virtual {v0, v13}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 184
    .line 185
    .line 186
    move-result-object v13

    .line 187
    invoke-virtual {v13}, Lcom/android/launcher3/util/N2;->e()Z

    .line 188
    .line 189
    .line 190
    move-result v13

    .line 191
    if-eqz v13, :cond_1

    .line 192
    .line 193
    const/16 v13, 0x8

    .line 194
    .line 195
    invoke-virtual {v4, v13, v3}, Lz1/m;->u(IZ)V

    .line 196
    .line 197
    .line 198
    goto :goto_2

    .line 199
    :cond_1
    iget-object v13, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 200
    .line 201
    invoke-virtual {v0, v13}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Lcom/android/launcher3/util/N2;->d()Z

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    if-eqz v0, :cond_3

    .line 210
    .line 211
    const/16 v0, 0x10

    .line 212
    .line 213
    invoke-virtual {v4, v0, v3}, Lz1/m;->u(IZ)V

    .line 214
    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_2
    invoke-virtual {v0}, Lz1/L4;->b()Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    const/4 v3, 0x2

    .line 222
    invoke-virtual {v4, v3, v0}, Lz1/m;->u(IZ)V

    .line 223
    .line 224
    .line 225
    :cond_3
    :goto_2
    move-object v0, v14

    .line 226
    goto :goto_1

    .line 227
    :pswitch_1
    sget-object v0, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 228
    .line 229
    const/4 v13, 0x5

    .line 230
    if-ne v3, v13, :cond_4

    .line 231
    .line 232
    const/4 v3, 0x1

    .line 233
    goto :goto_3

    .line 234
    :cond_4
    const/4 v3, 0x0

    .line 235
    :goto_3
    const/4 v13, 0x4

    .line 236
    invoke-interface {v0, v13, v3}, Lcom/android/launcher3/util/p0;->d(IZ)Lcom/android/launcher3/util/p0;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {v4, v8, v0}, Lz1/m;->x(Ljava/util/function/Predicate;Lcom/android/launcher3/util/p0;)V

    .line 241
    .line 242
    .line 243
    goto :goto_1

    .line 244
    :pswitch_2
    const/4 v3, 0x0

    .line 245
    :goto_4
    if-ge v3, v5, :cond_6

    .line 246
    .line 247
    aget-object v13, v16, v3

    .line 248
    .line 249
    iget-object v14, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 250
    .line 251
    invoke-virtual {v11, v13, v14}, Lt1/f;->P(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 252
    .line 253
    .line 254
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 255
    .line 256
    .line 257
    move-result-object v13

    .line 258
    invoke-virtual {v13}, Lcom/android/launcher3/H5;->X0()Z

    .line 259
    .line 260
    .line 261
    move-result v13

    .line 262
    if-eqz v13, :cond_5

    .line 263
    .line 264
    aget-object v13, v16, v3

    .line 265
    .line 266
    iget-object v14, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 267
    .line 268
    invoke-virtual {v0, v13, v14}, Lcom/android/launcher3/resource/g;->h(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 269
    .line 270
    .line 271
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 272
    .line 273
    goto :goto_4

    .line 274
    :cond_6
    :pswitch_3
    const/4 v0, 0x0

    .line 275
    :goto_5
    if-ge v0, v5, :cond_7

    .line 276
    .line 277
    const-string v3, "PackageUpdatedTask"

    .line 278
    .line 279
    new-instance v13, Ljava/lang/StringBuilder;

    .line 280
    .line 281
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 282
    .line 283
    .line 284
    invoke-direct {v1}, Lz1/h4;->l()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v14

    .line 288
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    const-string v14, ": removing package="

    .line 292
    .line 293
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    aget-object v14, v16, v0

    .line 297
    .line 298
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v13

    .line 305
    invoke-static {v3, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    .line 307
    .line 308
    aget-object v3, v16, v0

    .line 309
    .line 310
    iget-object v13, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 311
    .line 312
    invoke-virtual {v4, v3, v13}, Lz1/m;->t(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 313
    .line 314
    .line 315
    add-int/lit8 v0, v0, 0x1

    .line 316
    .line 317
    goto :goto_5

    .line 318
    :cond_7
    sget-object v0, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 319
    .line 320
    const/4 v3, 0x2

    .line 321
    invoke-interface {v0, v3}, Lcom/android/launcher3/util/p0;->b(I)Lcom/android/launcher3/util/p0;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    goto/16 :goto_c

    .line 326
    .line 327
    :pswitch_4
    new-instance v0, Lz1/W3;

    .line 328
    .line 329
    invoke-direct {v0, v9}, Lz1/W3;-><init>(Ljava/util/HashSet;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v4, v0}, Lz1/m;->w(Ljava/util/function/Consumer;)Lcom/android/launcher3/util/a2;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    const/4 v0, 0x0

    .line 337
    :goto_6
    if-ge v0, v5, :cond_b

    .line 338
    .line 339
    :try_start_0
    aget-object v13, v16, v0

    .line 340
    .line 341
    iget-object v14, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 342
    .line 343
    invoke-virtual {v11, v13, v14}, Ls1/P;->X0(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 344
    .line 345
    .line 346
    aget-object v13, v16, v0

    .line 347
    .line 348
    new-instance v14, Lz1/Z3;

    .line 349
    .line 350
    invoke-direct {v14, v13}, Lz1/Z3;-><init>(Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    move/from16 v20, v0

    .line 354
    .line 355
    iget-object v0, v4, Lz1/m;->a:Ljava/util/ArrayList;

    .line 356
    .line 357
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    invoke-interface {v0, v14}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    invoke-interface {v0}, Ljava/util/stream/Stream;->count()J

    .line 366
    .line 367
    .line 368
    move-result-wide v21

    .line 369
    aget-object v0, v16, v20
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 370
    .line 371
    move-object/from16 v23, v3

    .line 372
    .line 373
    :try_start_1
    iget-object v3, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 374
    .line 375
    invoke-virtual {v4, v7, v0, v3}, Lz1/m;->z(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 376
    .line 377
    .line 378
    move-result-object v3

    .line 379
    invoke-virtual {v10, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    .line 381
    .line 382
    iget-object v0, v4, Lz1/m;->a:Ljava/util/ArrayList;

    .line 383
    .line 384
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    invoke-interface {v0, v14}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    invoke-interface {v0}, Ljava/util/stream/Stream;->count()J

    .line 393
    .line 394
    .line 395
    move-result-wide v24

    .line 396
    const-wide/16 v26, 0x1

    .line 397
    .line 398
    cmp-long v0, v21, v26

    .line 399
    .line 400
    if-gtz v0, :cond_8

    .line 401
    .line 402
    cmp-long v0, v24, v26

    .line 403
    .line 404
    if-lez v0, :cond_9

    .line 405
    .line 406
    :cond_8
    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 407
    .line 408
    .line 409
    :cond_9
    add-int/lit8 v0, v20, 0x1

    .line 410
    .line 411
    move-object/from16 v3, v23

    .line 412
    .line 413
    goto :goto_6

    .line 414
    :catchall_0
    move-exception v0

    .line 415
    :goto_7
    move-object v1, v0

    .line 416
    goto :goto_8

    .line 417
    :catchall_1
    move-exception v0

    .line 418
    move-object/from16 v23, v3

    .line 419
    .line 420
    goto :goto_7

    .line 421
    :goto_8
    if-eqz v23, :cond_a

    .line 422
    .line 423
    :try_start_2
    invoke-interface/range {v23 .. v23}, Lcom/android/launcher3/util/a2;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 424
    .line 425
    .line 426
    goto :goto_9

    .line 427
    :catchall_2
    move-exception v0

    .line 428
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 429
    .line 430
    .line 431
    :cond_a
    :goto_9
    throw v1

    .line 432
    :cond_b
    move-object/from16 v23, v3

    .line 433
    .line 434
    if-eqz v23, :cond_c

    .line 435
    .line 436
    invoke-interface/range {v23 .. v23}, Lcom/android/launcher3/util/a2;->close()V

    .line 437
    .line 438
    .line 439
    :cond_c
    sget-object v0, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 440
    .line 441
    const/4 v3, 0x2

    .line 442
    invoke-interface {v0, v3}, Lcom/android/launcher3/util/p0;->a(I)Lcom/android/launcher3/util/p0;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    goto :goto_c

    .line 447
    :pswitch_5
    const/4 v3, 0x0

    .line 448
    :goto_a
    if-ge v3, v5, :cond_f

    .line 449
    .line 450
    aget-object v13, v16, v3

    .line 451
    .line 452
    iget-object v14, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 453
    .line 454
    invoke-virtual {v11, v13, v14}, Ls1/P;->X0(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 455
    .line 456
    .line 457
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 458
    .line 459
    .line 460
    move-result-object v13

    .line 461
    invoke-virtual {v13}, Lcom/android/launcher3/H5;->X0()Z

    .line 462
    .line 463
    .line 464
    move-result v13

    .line 465
    if-eqz v13, :cond_d

    .line 466
    .line 467
    aget-object v13, v16, v3

    .line 468
    .line 469
    iget-object v14, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 470
    .line 471
    invoke-virtual {v0, v13, v14}, Lcom/android/launcher3/resource/g;->g(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 472
    .line 473
    .line 474
    :cond_d
    sget-object v13, Lf1/a;->i:Lf1/a$a;

    .line 475
    .line 476
    invoke-virtual {v13}, Lf1/a$a;->c()Z

    .line 477
    .line 478
    .line 479
    move-result v13

    .line 480
    if-eqz v13, :cond_e

    .line 481
    .line 482
    const-string v13, "PackageUpdatedTask"

    .line 483
    .line 484
    new-instance v14, Ljava/lang/StringBuilder;

    .line 485
    .line 486
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 487
    .line 488
    .line 489
    move-object/from16 v20, v0

    .line 490
    .line 491
    const-string v0, "OP_ADD: PROMISE_APPS_IN_ALL_APPS enabled: removing promise icon apps from package="

    .line 492
    .line 493
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 494
    .line 495
    .line 496
    aget-object v0, v16, v3

    .line 497
    .line 498
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    .line 500
    .line 501
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object v0

    .line 505
    invoke-static {v13, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    .line 507
    .line 508
    aget-object v0, v16, v3

    .line 509
    .line 510
    iget-object v13, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 511
    .line 512
    invoke-virtual {v4, v0, v13}, Lz1/m;->t(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 513
    .line 514
    .line 515
    goto :goto_b

    .line 516
    :cond_e
    move-object/from16 v20, v0

    .line 517
    .line 518
    :goto_b
    aget-object v0, v16, v3

    .line 519
    .line 520
    iget-object v13, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 521
    .line 522
    invoke-virtual {v4, v7, v0, v13}, Lz1/m;->e(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 523
    .line 524
    .line 525
    move-result-object v13

    .line 526
    invoke-virtual {v10, v0, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    .line 528
    .line 529
    add-int/lit8 v3, v3, 0x1

    .line 530
    .line 531
    move-object/from16 v0, v20

    .line 532
    .line 533
    goto :goto_a

    .line 534
    :cond_f
    sget-object v0, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 535
    .line 536
    const/4 v3, 0x2

    .line 537
    invoke-interface {v0, v3}, Lcom/android/launcher3/util/p0;->a(I)Lcom/android/launcher3/util/p0;

    .line 538
    .line 539
    .line 540
    move-result-object v0

    .line 541
    :goto_c
    invoke-static {v7}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 542
    .line 543
    .line 544
    move-result-object v13

    .line 545
    new-instance v14, Ljava/util/ArrayList;

    .line 546
    .line 547
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 548
    .line 549
    .line 550
    move/from16 v20, v5

    .line 551
    .line 552
    iget v5, v1, Lz1/h4;->a:I

    .line 553
    .line 554
    move-object/from16 v21, v6

    .line 555
    .line 556
    const/4 v6, 0x1

    .line 557
    if-eq v5, v6, :cond_12

    .line 558
    .line 559
    if-ne v5, v3, :cond_10

    .line 560
    .line 561
    goto :goto_d

    .line 562
    :cond_10
    move-object/from16 v22, v7

    .line 563
    .line 564
    :cond_11
    move-object/from16 v28, v8

    .line 565
    .line 566
    move-object/from16 v17, v9

    .line 567
    .line 568
    const/4 v8, 0x0

    .line 569
    goto/16 :goto_13

    .line 570
    .line 571
    :cond_12
    :goto_d
    invoke-static {}, Lx1/O;->D0()Ljava/lang/String;

    .line 572
    .line 573
    .line 574
    move-result-object v3

    .line 575
    const-string v5, "PackageUpdatedTask"

    .line 576
    .line 577
    new-instance v6, Ljava/lang/StringBuilder;

    .line 578
    .line 579
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 580
    .line 581
    .line 582
    move-object/from16 v22, v7

    .line 583
    .line 584
    const-string v7, "execute: replaceFeatureString="

    .line 585
    .line 586
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    .line 588
    .line 589
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    move-result-object v6

    .line 596
    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    .line 598
    .line 599
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 600
    .line 601
    .line 602
    move-result v5

    .line 603
    if-nez v5, :cond_11

    .line 604
    .line 605
    invoke-static {v3}, Lx1/O;->l4(Ljava/lang/String;)Ljava/util/List;

    .line 606
    .line 607
    .line 608
    move-result-object v3

    .line 609
    iget-object v5, v1, Lz1/h4;->c:[Ljava/lang/String;

    .line 610
    .line 611
    array-length v6, v5

    .line 612
    const/4 v7, 0x0

    .line 613
    :goto_e
    if-ge v7, v6, :cond_11

    .line 614
    .line 615
    move-object/from16 v23, v3

    .line 616
    .line 617
    aget-object v3, v5, v7

    .line 618
    .line 619
    invoke-interface/range {v23 .. v23}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 620
    .line 621
    .line 622
    move-result-object v24

    .line 623
    :goto_f
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    .line 624
    .line 625
    .line 626
    move-result v25

    .line 627
    if-eqz v25, :cond_17

    .line 628
    .line 629
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 630
    .line 631
    .line 632
    move-result-object v25

    .line 633
    move-object/from16 v26, v5

    .line 634
    .line 635
    move-object/from16 v5, v25

    .line 636
    .line 637
    check-cast v5, Landroid/util/Pair;

    .line 638
    .line 639
    if-nez v5, :cond_13

    .line 640
    .line 641
    :goto_10
    move-object/from16 v5, v26

    .line 642
    .line 643
    goto :goto_f

    .line 644
    :cond_13
    move/from16 v25, v6

    .line 645
    .line 646
    iget-object v6, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 647
    .line 648
    check-cast v6, Landroid/content/ComponentName;

    .line 649
    .line 650
    iget-object v5, v5, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 651
    .line 652
    check-cast v5, Landroid/content/ComponentName;

    .line 653
    .line 654
    if-eqz v6, :cond_16

    .line 655
    .line 656
    if-nez v5, :cond_14

    .line 657
    .line 658
    move/from16 v6, v25

    .line 659
    .line 660
    goto :goto_10

    .line 661
    :cond_14
    move/from16 v27, v7

    .line 662
    .line 663
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 664
    .line 665
    .line 666
    move-result-object v7

    .line 667
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 668
    .line 669
    .line 670
    move-result v7

    .line 671
    if-eqz v7, :cond_15

    .line 672
    .line 673
    new-instance v7, Lcom/android/launcher3/resource/P;

    .line 674
    .line 675
    move-object/from16 v28, v8

    .line 676
    .line 677
    move-object/from16 v17, v9

    .line 678
    .line 679
    const/4 v8, 0x0

    .line 680
    const/4 v9, 0x1

    .line 681
    invoke-direct {v7, v6, v5, v9, v8}, Lcom/android/launcher3/resource/P;-><init>(Landroid/content/ComponentName;Landroid/content/ComponentName;ZZ)V

    .line 682
    .line 683
    .line 684
    invoke-virtual {v7, v15, v13, v2}, Lcom/android/launcher3/resource/P;->f(Lz1/o3;Lcom/android/launcher3/P2;Lz1/y0;)V

    .line 685
    .line 686
    .line 687
    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 688
    .line 689
    .line 690
    goto :goto_11

    .line 691
    :cond_15
    move-object/from16 v28, v8

    .line 692
    .line 693
    move-object/from16 v17, v9

    .line 694
    .line 695
    const/4 v8, 0x0

    .line 696
    :goto_11
    move-object/from16 v9, v17

    .line 697
    .line 698
    move/from16 v6, v25

    .line 699
    .line 700
    move-object/from16 v5, v26

    .line 701
    .line 702
    move/from16 v7, v27

    .line 703
    .line 704
    :goto_12
    move-object/from16 v8, v28

    .line 705
    .line 706
    goto :goto_f

    .line 707
    :cond_16
    move-object/from16 v28, v8

    .line 708
    .line 709
    const/4 v8, 0x0

    .line 710
    move/from16 v6, v25

    .line 711
    .line 712
    move-object/from16 v5, v26

    .line 713
    .line 714
    goto :goto_12

    .line 715
    :cond_17
    move-object/from16 v26, v5

    .line 716
    .line 717
    move/from16 v25, v6

    .line 718
    .line 719
    move/from16 v27, v7

    .line 720
    .line 721
    move-object/from16 v28, v8

    .line 722
    .line 723
    move-object/from16 v17, v9

    .line 724
    .line 725
    const/4 v8, 0x0

    .line 726
    add-int/lit8 v7, v27, 0x1

    .line 727
    .line 728
    move-object/from16 v3, v23

    .line 729
    .line 730
    move-object/from16 v8, v28

    .line 731
    .line 732
    goto :goto_e

    .line 733
    :goto_13
    invoke-virtual {v13}, Lcom/android/launcher3/P2;->c()LR1/h;

    .line 734
    .line 735
    .line 736
    move-result-object v3

    .line 737
    if-eqz v3, :cond_19

    .line 738
    .line 739
    iget v5, v1, Lz1/h4;->a:I

    .line 740
    .line 741
    const/4 v6, 0x1

    .line 742
    if-eq v5, v6, :cond_18

    .line 743
    .line 744
    const/4 v6, 0x2

    .line 745
    if-ne v5, v6, :cond_19

    .line 746
    .line 747
    :cond_18
    iget-object v5, v1, Lz1/h4;->c:[Ljava/lang/String;

    .line 748
    .line 749
    array-length v6, v5

    .line 750
    move v7, v8

    .line 751
    :goto_14
    if-ge v7, v6, :cond_19

    .line 752
    .line 753
    aget-object v9, v5, v7

    .line 754
    .line 755
    const/4 v8, 0x0

    .line 756
    invoke-virtual {v3, v15, v9, v8}, LR1/h;->D(Lz1/o3;Ljava/lang/String;Ljava/lang/String;)V

    .line 757
    .line 758
    .line 759
    add-int/lit8 v7, v7, 0x1

    .line 760
    .line 761
    const/4 v8, 0x0

    .line 762
    goto :goto_14

    .line 763
    :cond_19
    iget v3, v1, Lz1/h4;->a:I

    .line 764
    .line 765
    iget-object v5, v1, Lz1/h4;->c:[Ljava/lang/String;

    .line 766
    .line 767
    invoke-direct {v1, v15, v3, v5}, Lz1/h4;->q(Lz1/o3;I[Ljava/lang/String;)V

    .line 768
    .line 769
    .line 770
    invoke-direct {v1, v13, v4}, Lz1/h4;->y(Lcom/android/launcher3/P2;Lz1/m;)V

    .line 771
    .line 772
    .line 773
    invoke-virtual {v15}, Lz1/o3;->y()V

    .line 774
    .line 775
    .line 776
    new-instance v5, Lcom/android/launcher3/util/z0;

    .line 777
    .line 778
    invoke-direct {v5}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 779
    .line 780
    .line 781
    new-instance v3, Lcom/android/launcher3/util/z0;

    .line 782
    .line 783
    invoke-direct {v3}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 784
    .line 785
    .line 786
    iget v6, v1, Lz1/h4;->a:I

    .line 787
    .line 788
    const/4 v9, 0x1

    .line 789
    if-eq v6, v9, :cond_1a

    .line 790
    .line 791
    sget-object v6, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 792
    .line 793
    if-eq v0, v6, :cond_1b

    .line 794
    .line 795
    :cond_1a
    move-object v6, v14

    .line 796
    goto :goto_15

    .line 797
    :cond_1b
    move-object/from16 v29, v16

    .line 798
    .line 799
    move-object/from16 v8, v17

    .line 800
    .line 801
    move/from16 v30, v20

    .line 802
    .line 803
    move-object/from16 v7, v22

    .line 804
    .line 805
    const/16 v17, 0x0

    .line 806
    .line 807
    goto/16 :goto_1c

    .line 808
    .line 809
    :goto_15
    new-instance v14, Ljava/util/ArrayList;

    .line 810
    .line 811
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 812
    .line 813
    .line 814
    iget v7, v1, Lz1/h4;->a:I

    .line 815
    .line 816
    const/4 v8, 0x2

    .line 817
    if-eq v7, v9, :cond_1d

    .line 818
    .line 819
    if-ne v7, v8, :cond_1c

    .line 820
    .line 821
    goto :goto_16

    .line 822
    :cond_1c
    move-object v7, v6

    .line 823
    const/4 v6, 0x0

    .line 824
    goto :goto_17

    .line 825
    :cond_1d
    :goto_16
    move-object v7, v6

    .line 826
    move v6, v9

    .line 827
    :goto_17
    monitor-enter p2

    .line 828
    move-object/from16 v18, v0

    .line 829
    .line 830
    :try_start_3
    iget-object v0, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 831
    .line 832
    move-object/from16 v19, v0

    .line 833
    .line 834
    new-instance v0, Lz1/a4;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 835
    .line 836
    move-object/from16 v32, v7

    .line 837
    .line 838
    move-object v9, v12

    .line 839
    move-object/from16 v29, v16

    .line 840
    .line 841
    move-object/from16 v8, v17

    .line 842
    .line 843
    move-object/from16 v12, v18

    .line 844
    .line 845
    move-object/from16 v33, v19

    .line 846
    .line 847
    move/from16 v30, v20

    .line 848
    .line 849
    move-object/from16 v31, v21

    .line 850
    .line 851
    move-object/from16 v7, v22

    .line 852
    .line 853
    move-object/from16 v2, v28

    .line 854
    .line 855
    const/16 v17, 0x0

    .line 856
    .line 857
    :try_start_4
    invoke-direct/range {v0 .. v15}, Lz1/a4;-><init>(Lz1/h4;Ljava/util/function/Predicate;Lcom/android/launcher3/util/z0;Lz1/m;Lcom/android/launcher3/util/z0;ZLandroid/content/Context;Ljava/util/HashSet;Ljava/util/ArrayList;Ljava/util/HashMap;Ls1/P;Lcom/android/launcher3/util/p0;Lcom/android/launcher3/P2;Ljava/util/ArrayList;Lz1/o3;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 858
    .line 859
    .line 860
    move-object/from16 v2, p2

    .line 861
    .line 862
    move-object/from16 v4, v33

    .line 863
    .line 864
    :try_start_5
    invoke-virtual {v2, v4, v0}, Lz1/y0;->p(Landroid/os/UserHandle;Ljava/util/function/Consumer;)V

    .line 865
    .line 866
    .line 867
    iget-object v0, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 868
    .line 869
    invoke-virtual {v0}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 870
    .line 871
    .line 872
    move-result-object v0

    .line 873
    sget-object v4, Lz1/r3;->a:Ljava/util/function/Predicate;

    .line 874
    .line 875
    invoke-interface {v0, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 876
    .line 877
    .line 878
    move-result-object v0

    .line 879
    new-instance v4, Lz1/b4;

    .line 880
    .line 881
    invoke-direct {v4, v1}, Lz1/b4;-><init>(Lz1/h4;)V

    .line 882
    .line 883
    .line 884
    invoke-interface {v0, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 885
    .line 886
    .line 887
    move-result-object v0

    .line 888
    new-instance v4, Lz1/c4;

    .line 889
    .line 890
    invoke-direct {v4}, Lz1/c4;-><init>()V

    .line 891
    .line 892
    .line 893
    invoke-interface {v0, v4}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 894
    .line 895
    .line 896
    move-result-object v0

    .line 897
    new-instance v4, Lz1/d4;

    .line 898
    .line 899
    move-object/from16 v6, v31

    .line 900
    .line 901
    invoke-direct {v4, v6}, Lz1/d4;-><init>(Ljava/util/HashSet;)V

    .line 902
    .line 903
    .line 904
    invoke-interface {v0, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 905
    .line 906
    .line 907
    move-result-object v0

    .line 908
    new-instance v4, Lz1/e4;

    .line 909
    .line 910
    invoke-direct {v4, v14, v15}, Lz1/e4;-><init>(Ljava/util/ArrayList;Lz1/o3;)V

    .line 911
    .line 912
    .line 913
    invoke-interface {v0, v4}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 914
    .line 915
    .line 916
    monitor-exit p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 917
    invoke-direct {v1, v13, v5}, Lz1/h4;->r(Lcom/android/launcher3/P2;Lcom/android/launcher3/util/z0;)V

    .line 918
    .line 919
    .line 920
    invoke-virtual {v15, v14}, Lz1/o3;->G(Ljava/util/Collection;)V

    .line 921
    .line 922
    .line 923
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 924
    .line 925
    .line 926
    move-result-object v0

    .line 927
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 928
    .line 929
    .line 930
    move-result v0

    .line 931
    if-nez v0, :cond_21

    .line 932
    .line 933
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 934
    .line 935
    .line 936
    move-result-object v0

    .line 937
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 938
    .line 939
    .line 940
    move-result v0

    .line 941
    if-eqz v0, :cond_21

    .line 942
    .line 943
    invoke-virtual {v13}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 944
    .line 945
    .line 946
    move-result-object v0

    .line 947
    invoke-static {v0}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 948
    .line 949
    .line 950
    move-result v0

    .line 951
    if-eqz v0, :cond_21

    .line 952
    .line 953
    invoke-static {}, Lx1/Y;->h()Z

    .line 954
    .line 955
    .line 956
    move-result v0

    .line 957
    if-eqz v0, :cond_21

    .line 958
    .line 959
    new-instance v0, Ljava/util/ArrayList;

    .line 960
    .line 961
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 962
    .line 963
    .line 964
    new-instance v4, Ljava/util/ArrayList;

    .line 965
    .line 966
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 967
    .line 968
    .line 969
    iget-object v6, v1, Lz1/h4;->d:Ljava/util/ArrayList;

    .line 970
    .line 971
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 972
    .line 973
    .line 974
    move-result-object v6

    .line 975
    :goto_18
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 976
    .line 977
    .line 978
    move-result v9

    .line 979
    if-eqz v9, :cond_1f

    .line 980
    .line 981
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 982
    .line 983
    .line 984
    move-result-object v9

    .line 985
    check-cast v9, Lcom/android/launcher3/model/data/d;

    .line 986
    .line 987
    invoke-static {v9}, Lcom/android/launcher3/resource/h1;->h0(Lcom/android/launcher3/model/data/y;)Z

    .line 988
    .line 989
    .line 990
    move-result v10

    .line 991
    if-eqz v10, :cond_1e

    .line 992
    .line 993
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 994
    .line 995
    .line 996
    goto :goto_18

    .line 997
    :cond_1e
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 998
    .line 999
    .line 1000
    goto :goto_18

    .line 1001
    :cond_1f
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 1002
    .line 1003
    .line 1004
    move-result v6

    .line 1005
    if-nez v6, :cond_20

    .line 1006
    .line 1007
    invoke-virtual {v13}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 1008
    .line 1009
    .line 1010
    move-result-object v6

    .line 1011
    new-instance v9, Lx1/O$b;

    .line 1012
    .line 1013
    invoke-virtual {v13}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 1014
    .line 1015
    .line 1016
    move-result-object v10

    .line 1017
    invoke-direct {v9, v0, v10}, Lx1/O$b;-><init>(Ljava/util/ArrayList;Landroid/content/Context;)V

    .line 1018
    .line 1019
    .line 1020
    invoke-virtual {v9}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 1021
    .line 1022
    .line 1023
    move-result-object v0

    .line 1024
    invoke-virtual {v6, v0}, Lcom/android/launcher3/D3;->L(Ljava/util/List;)V

    .line 1025
    .line 1026
    .line 1027
    :cond_20
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 1028
    .line 1029
    .line 1030
    move-result v0

    .line 1031
    if-nez v0, :cond_25

    .line 1032
    .line 1033
    invoke-virtual {v15, v4}, Lz1/o3;->x(Ljava/util/ArrayList;)V

    .line 1034
    .line 1035
    .line 1036
    goto :goto_1b

    .line 1037
    :cond_21
    new-instance v0, Ljava/util/ArrayList;

    .line 1038
    .line 1039
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1040
    .line 1041
    .line 1042
    iget-object v4, v1, Lz1/h4;->d:Ljava/util/ArrayList;

    .line 1043
    .line 1044
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 1045
    .line 1046
    .line 1047
    move-result-object v4

    .line 1048
    :goto_19
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 1049
    .line 1050
    .line 1051
    move-result v6

    .line 1052
    if-eqz v6, :cond_24

    .line 1053
    .line 1054
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1055
    .line 1056
    .line 1057
    move-result-object v6

    .line 1058
    check-cast v6, Lcom/android/launcher3/model/data/d;

    .line 1059
    .line 1060
    iget-object v9, v6, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 1061
    .line 1062
    if-eqz v9, :cond_22

    .line 1063
    .line 1064
    invoke-virtual {v9}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 1065
    .line 1066
    .line 1067
    move-result-object v9

    .line 1068
    move-object/from16 v10, v32

    .line 1069
    .line 1070
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 1071
    .line 1072
    .line 1073
    move-result v9

    .line 1074
    if-nez v9, :cond_23

    .line 1075
    .line 1076
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1077
    .line 1078
    .line 1079
    goto :goto_1a

    .line 1080
    :cond_22
    move-object/from16 v10, v32

    .line 1081
    .line 1082
    :cond_23
    :goto_1a
    move-object/from16 v32, v10

    .line 1083
    .line 1084
    goto :goto_19

    .line 1085
    :cond_24
    invoke-virtual {v15, v0}, Lz1/o3;->x(Ljava/util/ArrayList;)V

    .line 1086
    .line 1087
    .line 1088
    :cond_25
    :goto_1b
    invoke-virtual {v5}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 1089
    .line 1090
    .line 1091
    move-result v0

    .line 1092
    if-nez v0, :cond_26

    .line 1093
    .line 1094
    invoke-static {v5}, Lcom/android/launcher3/util/P0;->q(Lcom/android/launcher3/util/z0;)Ljava/util/function/Predicate;

    .line 1095
    .line 1096
    .line 1097
    move-result-object v0

    .line 1098
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1099
    .line 1100
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1101
    .line 1102
    .line 1103
    const-string v6, "removing shortcuts with invalid target components. ids="

    .line 1104
    .line 1105
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1106
    .line 1107
    .line 1108
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1109
    .line 1110
    .line 1111
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1112
    .line 1113
    .line 1114
    move-result-object v4

    .line 1115
    invoke-virtual {v15, v0, v4}, Lz1/o3;->P(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 1116
    .line 1117
    .line 1118
    :cond_26
    :goto_1c
    new-instance v0, Ljava/util/HashSet;

    .line 1119
    .line 1120
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1121
    .line 1122
    .line 1123
    iget v4, v1, Lz1/h4;->a:I

    .line 1124
    .line 1125
    const/4 v6, 0x3

    .line 1126
    if-ne v4, v6, :cond_28

    .line 1127
    .line 1128
    move-object/from16 v5, v29

    .line 1129
    .line 1130
    invoke-static {v0, v5}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 1131
    .line 1132
    .line 1133
    const-string v4, "PackageUpdatedTask"

    .line 1134
    .line 1135
    new-instance v9, Ljava/lang/StringBuilder;

    .line 1136
    .line 1137
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 1138
    .line 1139
    .line 1140
    const-string v10, "OP_REMOVE: removing packages="

    .line 1141
    .line 1142
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1143
    .line 1144
    .line 1145
    invoke-static {v5}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 1146
    .line 1147
    .line 1148
    move-result-object v10

    .line 1149
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1150
    .line 1151
    .line 1152
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1153
    .line 1154
    .line 1155
    move-result-object v9

    .line 1156
    invoke-static {v4, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1157
    .line 1158
    .line 1159
    :cond_27
    move/from16 v10, v30

    .line 1160
    .line 1161
    goto :goto_1e

    .line 1162
    :cond_28
    move-object/from16 v5, v29

    .line 1163
    .line 1164
    const/4 v9, 0x2

    .line 1165
    if-ne v4, v9, :cond_27

    .line 1166
    .line 1167
    const-class v4, Landroid/content/pm/LauncherApps;

    .line 1168
    .line 1169
    invoke-virtual {v7, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 1170
    .line 1171
    .line 1172
    move-result-object v4

    .line 1173
    check-cast v4, Landroid/content/pm/LauncherApps;

    .line 1174
    .line 1175
    move/from16 v14, v17

    .line 1176
    .line 1177
    move/from16 v10, v30

    .line 1178
    .line 1179
    :goto_1d
    if-ge v14, v10, :cond_2a

    .line 1180
    .line 1181
    aget-object v11, v5, v14

    .line 1182
    .line 1183
    iget-object v12, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 1184
    .line 1185
    invoke-virtual {v4, v11, v12}, Landroid/content/pm/LauncherApps;->isPackageEnabled(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 1186
    .line 1187
    .line 1188
    move-result v11

    .line 1189
    if-nez v11, :cond_29

    .line 1190
    .line 1191
    const-string v11, "PackageUpdatedTask"

    .line 1192
    .line 1193
    new-instance v12, Ljava/lang/StringBuilder;

    .line 1194
    .line 1195
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 1196
    .line 1197
    .line 1198
    const-string v9, "OP_UPDATE: package "

    .line 1199
    .line 1200
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1201
    .line 1202
    .line 1203
    aget-object v9, v5, v14

    .line 1204
    .line 1205
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1206
    .line 1207
    .line 1208
    const-string v9, " is disabled, removing package."

    .line 1209
    .line 1210
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1211
    .line 1212
    .line 1213
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1214
    .line 1215
    .line 1216
    move-result-object v9

    .line 1217
    invoke-static {v11, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1218
    .line 1219
    .line 1220
    aget-object v9, v5, v14

    .line 1221
    .line 1222
    invoke-virtual {v0, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1223
    .line 1224
    .line 1225
    :cond_29
    aget-object v9, v5, v14

    .line 1226
    .line 1227
    invoke-direct {v1, v13, v2, v9}, Lz1/h4;->v(Lcom/android/launcher3/P2;Lz1/y0;Ljava/lang/String;)V

    .line 1228
    .line 1229
    .line 1230
    add-int/lit8 v14, v14, 0x1

    .line 1231
    .line 1232
    const/4 v9, 0x2

    .line 1233
    goto :goto_1d

    .line 1234
    :cond_2a
    :goto_1e
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    .line 1235
    .line 1236
    .line 1237
    move-result v4

    .line 1238
    if-eqz v4, :cond_2b

    .line 1239
    .line 1240
    invoke-virtual {v8}, Ljava/util/HashSet;->isEmpty()Z

    .line 1241
    .line 1242
    .line 1243
    move-result v4

    .line 1244
    if-nez v4, :cond_2f

    .line 1245
    .line 1246
    :cond_2b
    iget-object v4, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 1247
    .line 1248
    invoke-static {v0, v4}, Lcom/android/launcher3/util/P0;->t(Ljava/util/Set;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 1249
    .line 1250
    .line 1251
    move-result-object v4

    .line 1252
    iget-object v9, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 1253
    .line 1254
    invoke-static {v8, v9}, Lcom/android/launcher3/util/P0;->p(Ljava/util/HashSet;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 1255
    .line 1256
    .line 1257
    move-result-object v9

    .line 1258
    invoke-interface {v4, v9}, Ljava/util/function/Predicate;->or(Ljava/util/function/Predicate;)Ljava/util/function/Predicate;

    .line 1259
    .line 1260
    .line 1261
    move-result-object v4

    .line 1262
    iget-object v9, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 1263
    .line 1264
    invoke-static {v0, v9}, Lcom/android/launcher3/util/P0;->x(Ljava/util/Set;Landroid/os/UserHandle;)Ljava/util/function/Predicate;

    .line 1265
    .line 1266
    .line 1267
    move-result-object v9

    .line 1268
    invoke-interface {v4, v9}, Ljava/util/function/Predicate;->or(Ljava/util/function/Predicate;)Ljava/util/function/Predicate;

    .line 1269
    .line 1270
    .line 1271
    move-result-object v4

    .line 1272
    invoke-static {v3}, Lcom/android/launcher3/util/P0;->q(Lcom/android/launcher3/util/z0;)Ljava/util/function/Predicate;

    .line 1273
    .line 1274
    .line 1275
    move-result-object v3

    .line 1276
    invoke-interface {v3}, Ljava/util/function/Predicate;->negate()Ljava/util/function/Predicate;

    .line 1277
    .line 1278
    .line 1279
    move-result-object v3

    .line 1280
    invoke-interface {v4, v3}, Ljava/util/function/Predicate;->and(Ljava/util/function/Predicate;)Ljava/util/function/Predicate;

    .line 1281
    .line 1282
    .line 1283
    move-result-object v3

    .line 1284
    invoke-virtual {v13}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 1285
    .line 1286
    .line 1287
    move-result-object v4

    .line 1288
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1289
    .line 1290
    .line 1291
    move-result-object v4

    .line 1292
    if-eqz v4, :cond_2e

    .line 1293
    .line 1294
    invoke-virtual {v13}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 1295
    .line 1296
    .line 1297
    move-result-object v4

    .line 1298
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1299
    .line 1300
    .line 1301
    move-result-object v4

    .line 1302
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1303
    .line 1304
    .line 1305
    move-result-object v4

    .line 1306
    invoke-virtual {v4}, Lcom/android/launcher3/r4;->h()Ljava/util/ArrayList;

    .line 1307
    .line 1308
    .line 1309
    move-result-object v4

    .line 1310
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 1311
    .line 1312
    .line 1313
    move-result v4

    .line 1314
    if-nez v4, :cond_2e

    .line 1315
    .line 1316
    new-instance v4, Ljava/util/ArrayList;

    .line 1317
    .line 1318
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1319
    .line 1320
    .line 1321
    invoke-virtual {v13}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 1322
    .line 1323
    .line 1324
    move-result-object v9

    .line 1325
    invoke-static {v9}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1326
    .line 1327
    .line 1328
    move-result-object v9

    .line 1329
    invoke-virtual {v9}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1330
    .line 1331
    .line 1332
    move-result-object v9

    .line 1333
    invoke-virtual {v9}, Lcom/android/launcher3/r4;->h()Ljava/util/ArrayList;

    .line 1334
    .line 1335
    .line 1336
    move-result-object v9

    .line 1337
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 1338
    .line 1339
    .line 1340
    move-result-object v9

    .line 1341
    :cond_2c
    :goto_1f
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 1342
    .line 1343
    .line 1344
    move-result v11

    .line 1345
    if-eqz v11, :cond_2d

    .line 1346
    .line 1347
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1348
    .line 1349
    .line 1350
    move-result-object v11

    .line 1351
    check-cast v11, Landroid/content/ComponentName;

    .line 1352
    .line 1353
    if-eqz v11, :cond_2c

    .line 1354
    .line 1355
    invoke-virtual {v11}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 1356
    .line 1357
    .line 1358
    move-result-object v12

    .line 1359
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 1360
    .line 1361
    .line 1362
    move-result v12

    .line 1363
    if-nez v12, :cond_2c

    .line 1364
    .line 1365
    invoke-virtual {v11}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 1366
    .line 1367
    .line 1368
    move-result-object v11

    .line 1369
    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1370
    .line 1371
    .line 1372
    goto :goto_1f

    .line 1373
    :cond_2d
    new-instance v9, Lz1/f4;

    .line 1374
    .line 1375
    invoke-direct {v9, v4}, Lz1/f4;-><init>(Ljava/util/ArrayList;)V

    .line 1376
    .line 1377
    .line 1378
    invoke-interface {v9}, Ljava/util/function/Predicate;->negate()Ljava/util/function/Predicate;

    .line 1379
    .line 1380
    .line 1381
    move-result-object v4

    .line 1382
    invoke-interface {v3, v4}, Ljava/util/function/Predicate;->and(Ljava/util/function/Predicate;)Ljava/util/function/Predicate;

    .line 1383
    .line 1384
    .line 1385
    move-result-object v3

    .line 1386
    :cond_2e
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1387
    .line 1388
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1389
    .line 1390
    .line 1391
    const-string v9, "removed because the corresponding package or component is removed. mOp="

    .line 1392
    .line 1393
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1394
    .line 1395
    .line 1396
    iget v9, v1, Lz1/h4;->a:I

    .line 1397
    .line 1398
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1399
    .line 1400
    .line 1401
    const-string v9, " removedPackages="

    .line 1402
    .line 1403
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1404
    .line 1405
    .line 1406
    invoke-virtual {v0}, Ljava/util/HashSet;->stream()Ljava/util/stream/Stream;

    .line 1407
    .line 1408
    .line 1409
    move-result-object v9

    .line 1410
    const-string v11, ","

    .line 1411
    .line 1412
    const-string v12, "["

    .line 1413
    .line 1414
    const-string v14, "]"

    .line 1415
    .line 1416
    invoke-static {v11, v12, v14}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 1417
    .line 1418
    .line 1419
    move-result-object v11

    .line 1420
    invoke-interface {v9, v11}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 1421
    .line 1422
    .line 1423
    move-result-object v9

    .line 1424
    check-cast v9, Ljava/lang/String;

    .line 1425
    .line 1426
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1427
    .line 1428
    .line 1429
    const-string v9, " removedComponents="

    .line 1430
    .line 1431
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1432
    .line 1433
    .line 1434
    invoke-virtual {v8}, Ljava/util/HashSet;->stream()Ljava/util/stream/Stream;

    .line 1435
    .line 1436
    .line 1437
    move-result-object v8

    .line 1438
    new-instance v9, Lcom/android/launcher3/folder/P;

    .line 1439
    .line 1440
    invoke-direct {v9}, Lcom/android/launcher3/folder/P;-><init>()V

    .line 1441
    .line 1442
    .line 1443
    invoke-interface {v8, v9}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 1444
    .line 1445
    .line 1446
    move-result-object v8

    .line 1447
    new-instance v9, Lz1/g4;

    .line 1448
    .line 1449
    invoke-direct {v9}, Lz1/g4;-><init>()V

    .line 1450
    .line 1451
    .line 1452
    invoke-interface {v8, v9}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 1453
    .line 1454
    .line 1455
    move-result-object v8

    .line 1456
    const-string v9, ","

    .line 1457
    .line 1458
    const-string v11, "["

    .line 1459
    .line 1460
    const-string v12, "]"

    .line 1461
    .line 1462
    invoke-static {v9, v11, v12}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 1463
    .line 1464
    .line 1465
    move-result-object v9

    .line 1466
    invoke-interface {v8, v9}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 1467
    .line 1468
    .line 1469
    move-result-object v8

    .line 1470
    check-cast v8, Ljava/lang/String;

    .line 1471
    .line 1472
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1473
    .line 1474
    .line 1475
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1476
    .line 1477
    .line 1478
    move-result-object v4

    .line 1479
    invoke-virtual {v15, v3, v4}, Lz1/o3;->P(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 1480
    .line 1481
    .line 1482
    sget-object v3, Lz1/t1;->f:Lcom/android/launcher3/util/I;

    .line 1483
    .line 1484
    invoke-virtual {v3, v7}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 1485
    .line 1486
    .line 1487
    move-result-object v3

    .line 1488
    check-cast v3, Lz1/t1;

    .line 1489
    .line 1490
    iget-object v4, v1, Lz1/h4;->b:Landroid/os/UserHandle;

    .line 1491
    .line 1492
    invoke-virtual {v3, v0, v4}, Lz1/t1;->B(Ljava/util/HashSet;Landroid/os/UserHandle;)V

    .line 1493
    .line 1494
    .line 1495
    invoke-direct {v1, v13, v0}, Lz1/h4;->w(Lcom/android/launcher3/P2;Ljava/util/HashSet;)V

    .line 1496
    .line 1497
    .line 1498
    :cond_2f
    iget v0, v1, Lz1/h4;->a:I

    .line 1499
    .line 1500
    const/4 v9, 0x1

    .line 1501
    if-eq v0, v9, :cond_31

    .line 1502
    .line 1503
    if-eq v0, v6, :cond_31

    .line 1504
    .line 1505
    const/4 v3, 0x2

    .line 1506
    if-ne v0, v3, :cond_30

    .line 1507
    .line 1508
    goto :goto_20

    .line 1509
    :cond_30
    move-object v4, v5

    .line 1510
    goto :goto_21

    .line 1511
    :cond_31
    :goto_20
    invoke-virtual {v13}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 1512
    .line 1513
    .line 1514
    move-result-object v7

    .line 1515
    new-instance v8, Lx1/x;

    .line 1516
    .line 1517
    new-instance v0, Lz1/Y3;

    .line 1518
    .line 1519
    move-object v3, v2

    .line 1520
    move-object v4, v5

    .line 1521
    move v2, v10

    .line 1522
    move-object v5, v15

    .line 1523
    invoke-direct/range {v0 .. v5}, Lz1/Y3;-><init>(Lz1/h4;ILz1/y0;[Ljava/lang/String;Lz1/o3;)V

    .line 1524
    .line 1525
    .line 1526
    move-object v2, v3

    .line 1527
    invoke-direct {v8, v0, v9}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 1528
    .line 1529
    .line 1530
    invoke-virtual {v7, v8}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 1531
    .line 1532
    .line 1533
    :goto_21
    invoke-static {}, Lx1/O;->C3()Z

    .line 1534
    .line 1535
    .line 1536
    move-result v0

    .line 1537
    if-eqz v0, :cond_32

    .line 1538
    .line 1539
    iget v0, v1, Lz1/h4;->a:I

    .line 1540
    .line 1541
    const/4 v3, 0x2

    .line 1542
    if-ne v0, v3, :cond_32

    .line 1543
    .line 1544
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 1545
    .line 1546
    .line 1547
    move-result-object v0

    .line 1548
    invoke-virtual {v15, v0}, Lz1/o3;->h0(Ljava/util/List;)V

    .line 1549
    .line 1550
    .line 1551
    :cond_32
    invoke-static {}, Lx1/O;->g5()Z

    .line 1552
    .line 1553
    .line 1554
    move-result v0

    .line 1555
    if-eqz v0, :cond_34

    .line 1556
    .line 1557
    invoke-static {}, Le1/f;->w()Le1/f;

    .line 1558
    .line 1559
    .line 1560
    move-result-object v0

    .line 1561
    if-eqz v0, :cond_34

    .line 1562
    .line 1563
    iget v1, v1, Lz1/h4;->a:I

    .line 1564
    .line 1565
    if-ne v1, v9, :cond_33

    .line 1566
    .line 1567
    array-length v1, v4

    .line 1568
    move/from16 v14, v17

    .line 1569
    .line 1570
    :goto_22
    if-ge v14, v1, :cond_34

    .line 1571
    .line 1572
    aget-object v2, v4, v14

    .line 1573
    .line 1574
    invoke-virtual {v0, v2}, Le1/f;->K(Ljava/lang/String;)V

    .line 1575
    .line 1576
    .line 1577
    add-int/lit8 v14, v14, 0x1

    .line 1578
    .line 1579
    goto :goto_22

    .line 1580
    :cond_33
    if-ne v1, v6, :cond_34

    .line 1581
    .line 1582
    array-length v1, v4

    .line 1583
    move/from16 v14, v17

    .line 1584
    .line 1585
    :goto_23
    if-ge v14, v1, :cond_34

    .line 1586
    .line 1587
    aget-object v3, v4, v14

    .line 1588
    .line 1589
    invoke-virtual {v0, v3, v15, v2}, Le1/f;->L(Ljava/lang/String;Lz1/o3;Lz1/y0;)V

    .line 1590
    .line 1591
    .line 1592
    add-int/lit8 v14, v14, 0x1

    .line 1593
    .line 1594
    goto :goto_23

    .line 1595
    :cond_34
    return-void

    .line 1596
    :catchall_3
    move-exception v0

    .line 1597
    goto :goto_24

    .line 1598
    :catchall_4
    move-exception v0

    .line 1599
    move-object/from16 v2, p2

    .line 1600
    .line 1601
    :goto_24
    :try_start_6
    monitor-exit p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 1602
    throw v0

    .line 1603
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
