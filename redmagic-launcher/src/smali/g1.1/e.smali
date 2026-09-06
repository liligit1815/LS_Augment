.class public final Lg1/e;
.super Ljava/lang/Object;
.source "LauncherComponentProvider.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lg1/e$a;
    }
.end annotation


# static fields
.field public static final a:Lg1/e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lg1/e;

    .line 2
    .line 3
    invoke-direct {v0}, Lg1/e;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lg1/e;->a:Lg1/e;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final a(Landroid/content/Context;)Lg1/c;
    .locals 4

    .line 1
    const-string v0, "c"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    instance-of v0, p0, Lcom/android/launcher3/LauncherApplication;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    check-cast p0, Lcom/android/launcher3/LauncherApplication;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/LauncherApplication;->b()Lg1/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v0, "getAppComponent(...)"

    .line 21
    .line 22
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/view/LayoutInflater;->getFilter()Landroid/view/LayoutInflater$Filter;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    instance-of v2, v1, Lg1/e$a;

    .line 35
    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    check-cast v1, Lg1/e$a;

    .line 39
    .line 40
    invoke-virtual {v1}, Lg1/e$a;->a()Lg1/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0

    .line 45
    :cond_1
    new-instance v2, Lg1/e$a;

    .line 46
    .line 47
    invoke-static {}, Lg1/a;->a()Lg1/c$a;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-interface {v3, p0}, Lg1/d$a;->c(Landroid/content/Context;)Lg1/d$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const/4 v3, 0x1

    .line 56
    invoke-interface {p0, v3}, Lg1/d$a;->b(Z)Lg1/d$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {p0}, Lg1/d$a;->build()Lg1/d;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string v3, "null cannot be cast to non-null type com.android.launcher3.dagger.LauncherAppComponent"

    .line 65
    .line 66
    invoke-static {p0, v3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    check-cast p0, Lg1/c;

    .line 70
    .line 71
    invoke-direct {v2, p0, v1}, Lg1/e$a;-><init>(Lg1/c;Landroid/view/LayoutInflater$Filter;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v2}, Landroid/view/LayoutInflater;->setFilter(Landroid/view/LayoutInflater$Filter;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Lg1/e$a;->a()Lg1/c;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/content/Context;)Lg1/c;
    .locals 0

    .line 1
    const-string p0, "<this>"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lg1/e;->a(Landroid/content/Context;)Lg1/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
