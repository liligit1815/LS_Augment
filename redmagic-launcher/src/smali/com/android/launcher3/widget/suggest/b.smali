.class public Lcom/android/launcher3/widget/suggest/b;
.super Landroid/content/ContextWrapper;
.source "SuggestCustomViewContext.java"


# instance fields
.field private a:Landroid/content/res/AssetManager;

.field private b:Landroid/content/res/Resources;

.field private c:Landroid/content/res/Resources$Theme;

.field private d:Ljava/lang/ClassLoader;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "CustomViewLayoutContext"

    .line 5
    .line 6
    const-string v1, "create"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/android/launcher3/widget/suggest/b;->f:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p3, p0, Lcom/android/launcher3/widget/suggest/b;->d:Ljava/lang/ClassLoader;

    .line 14
    .line 15
    iput-object p4, p0, Lcom/android/launcher3/widget/suggest/b;->e:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/b;->g:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/b;->a()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/b;->a:Landroid/content/res/AssetManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    :try_start_0
    const-class v0, Landroid/content/res/AssetManager;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/content/res/AssetManager;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "addAssetPath"

    .line 19
    .line 20
    const-class v3, Ljava/lang/String;

    .line 21
    .line 22
    filled-new-array {v3}, [Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, Lcom/android/launcher3/widget/suggest/b;->e:Ljava/lang/String;

    .line 31
    .line 32
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/android/launcher3/widget/suggest/b;->a:Landroid/content/res/AssetManager;

    .line 40
    .line 41
    invoke-super {p0}, Landroid/content/ContextWrapper;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    new-instance v2, Landroid/content/res/Resources;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-direct {v2, v0, v3, v1}, Landroid/content/res/Resources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    .line 56
    .line 57
    .line 58
    iput-object v2, p0, Lcom/android/launcher3/widget/suggest/b;->b:Landroid/content/res/Resources;

    .line 59
    .line 60
    invoke-virtual {v2}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/android/launcher3/widget/suggest/b;->c:Landroid/content/res/Resources$Theme;

    .line 65
    .line 66
    invoke-super {p0}, Landroid/content/ContextWrapper;->getTheme()Landroid/content/res/Resources$Theme;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :catch_0
    move-exception p0

    .line 75
    const-string v0, "CustomViewLayoutContext"

    .line 76
    .line 77
    const-string v1, "init error"

    .line 78
    .line 79
    invoke-static {v0, v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 80
    .line 81
    .line 82
    :goto_0
    return-void
.end method

.method public getApplicationContext()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/content/ContextWrapper;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getAssets()Landroid/content/res/AssetManager;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/b;->a()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/b;->a:Landroid/content/res/AssetManager;

    .line 5
    .line 6
    return-object p0
.end method

.method public final getClassLoader()Ljava/lang/ClassLoader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/b;->d:Ljava/lang/ClassLoader;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/b;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/b;->a()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/b;->b:Landroid/content/res/Resources;

    .line 5
    .line 6
    return-object p0
.end method

.method public getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    .locals 2

    .line 1
    const-string v0, "CustomViewLayoutContext"

    .line 2
    .line 3
    const-string v1, "This SharedPreferences is in Launcher progress. Please use other ways, provider"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1, p2}, Landroid/content/ContextWrapper;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public getTheme()Landroid/content/res/Resources$Theme;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/suggest/b;->a()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/suggest/b;->c:Landroid/content/res/Resources$Theme;

    .line 5
    .line 6
    return-object p0
.end method
