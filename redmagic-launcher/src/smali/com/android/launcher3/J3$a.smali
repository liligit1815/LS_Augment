.class public final Lcom/android/launcher3/J3$a;
.super Ljava/lang/Object;
.source "LauncherPrefs.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/J3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/J3$a;-><init>()V

    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/J3$a;Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;ILjava/lang/Object;)Lcom/android/launcher3/X;
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    sget-object p3, Lcom/android/launcher3/r0;->g:Lcom/android/launcher3/r0;

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/J3$a;->a(Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;)Lcom/android/launcher3/X;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic d(Lcom/android/launcher3/J3$a;Ljava/lang/String;Ljava/lang/Class;Lcom/android/launcher3/r0;Lu4/l;ILjava/lang/Object;)Lcom/android/launcher3/Y;
    .locals 0

    .line 1
    and-int/lit8 p5, p5, 0x4

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    sget-object p3, Lcom/android/launcher3/r0;->g:Lcom/android/launcher3/r0;

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/launcher3/J3$a;->b(Ljava/lang/String;Ljava/lang/Class;Lcom/android/launcher3/r0;Lu4/l;)Lcom/android/launcher3/Y;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic i(Lcom/android/launcher3/J3$a;Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;ILjava/lang/Object;)Lcom/android/launcher3/X;
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    sget-object p3, Lcom/android/launcher3/r0;->g:Lcom/android/launcher3/r0;

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/J3$a;->h(Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;)Lcom/android/launcher3/X;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;)Lcom/android/launcher3/X;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;",
            "Lcom/android/launcher3/r0;",
            ")",
            "Lcom/android/launcher3/X<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string p0, "sharedPrefKey"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "encryptionType"

    .line 7
    .line 8
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/X;

    .line 12
    .line 13
    const/16 v6, 0x10

    .line 14
    .line 15
    const/4 v7, 0x0

    .line 16
    const/4 v2, 0x1

    .line 17
    const/4 v5, 0x0

    .line 18
    move-object v1, p1

    .line 19
    move-object v3, p2

    .line 20
    move-object v4, p3

    .line 21
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/X;-><init>(Ljava/lang/String;ZLjava/lang/Object;Lcom/android/launcher3/r0;Ljava/lang/Class;ILkotlin/jvm/internal/j;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/Class;Lcom/android/launcher3/r0;Lu4/l;)Lcom/android/launcher3/Y;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "+TT;>;",
            "Lcom/android/launcher3/r0;",
            "Lu4/l<",
            "-",
            "Landroid/content/Context;",
            "+TT;>;)",
            "Lcom/android/launcher3/Y<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string p0, "sharedPrefKey"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "type"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "encryptionType"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "defaultValueFromContext"

    .line 17
    .line 18
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/Y;

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    move-object v1, p1

    .line 25
    move-object v5, p2

    .line 26
    move-object v4, p3

    .line 27
    move-object v3, p4

    .line 28
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/Y;-><init>(Ljava/lang/String;ZLu4/l;Lcom/android/launcher3/r0;Ljava/lang/Class;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public final e(Landroid/content/Context;)Lcom/android/launcher3/J3;
    .locals 0

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/android/launcher3/J3;->d:Lcom/android/launcher3/util/I;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "get(...)"

    .line 13
    .line 14
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    check-cast p0, Lcom/android/launcher3/J3;

    .line 18
    .line 19
    return-object p0
.end method

.method public final f(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 1

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "com.android.launcher3.device.prefs"

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "getSharedPreferences(...)"

    .line 18
    .line 19
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public final g(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 1

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object p1, Lcom/android/launcher3/W2;->a:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "getSharedPreferences(...)"

    .line 18
    .line 19
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public final h(Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;)Lcom/android/launcher3/X;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;",
            "Lcom/android/launcher3/r0;",
            ")",
            "Lcom/android/launcher3/X<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string p0, "sharedPrefKey"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "encryptionType"

    .line 7
    .line 8
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/X;

    .line 12
    .line 13
    const/16 v6, 0x10

    .line 14
    .line 15
    const/4 v7, 0x0

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v5, 0x0

    .line 18
    move-object v1, p1

    .line 19
    move-object v3, p2

    .line 20
    move-object v4, p3

    .line 21
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/X;-><init>(Ljava/lang/String;ZLjava/lang/Object;Lcom/android/launcher3/r0;Ljava/lang/Class;ILkotlin/jvm/internal/j;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method
