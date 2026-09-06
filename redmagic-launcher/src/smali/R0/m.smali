.class public LR0/m;
.super Ljava/lang/Object;
.source "AllAppsSortMode.java"


# static fields
.field private static volatile b:LR0/m;


# instance fields
.field private a:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, LR0/m;->a:I

    .line 6
    .line 7
    return-void
.end method

.method public static a()LR0/m;
    .locals 2

    .line 1
    sget-object v0, LR0/m;->b:LR0/m;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, LR0/m;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, LR0/m;->b:LR0/m;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, LR0/m;

    .line 13
    .line 14
    invoke-direct {v1}, LR0/m;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, LR0/m;->b:LR0/m;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, LR0/m;->b:LR0/m;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b(Landroid/content/Context;)I
    .locals 2

    .line 1
    iget v0, p0, LR0/m;->a:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v1, "all_apps_sort_mode"

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/r4;->j()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, LR0/m;->a:I

    .line 34
    .line 35
    invoke-static {p1}, Lh1/a;->e(I)V

    .line 36
    .line 37
    .line 38
    iget p0, p0, LR0/m;->a:I

    .line 39
    .line 40
    return p0
.end method

.method public c(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    array-length v0, p1

    .line 20
    new-array v0, v0, [Lcom/android/launcher3/model/data/d;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    array-length v2, p1

    .line 24
    if-ge v1, v2, :cond_0

    .line 25
    .line 26
    aget-object v2, p1, v1

    .line 27
    .line 28
    aput-object v2, v0, v1

    .line 29
    .line 30
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/D;->w([Lcom/android/launcher3/model/data/d;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, LR0/m;->a:I

    .line 3
    .line 4
    return-void
.end method

.method public e(Landroid/content/Context;I)V
    .locals 2

    .line 1
    iput p2, p0, LR0/m;->a:I

    .line 2
    .line 3
    invoke-static {p2}, Lh1/a;->e(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const-string v0, "all_apps_sort_mode"

    .line 15
    .line 16
    iget v1, p0, LR0/m;->a:I

    .line 17
    .line 18
    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 19
    .line 20
    .line 21
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, LR0/m;->c(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
