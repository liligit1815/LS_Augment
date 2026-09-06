.class public final Ls1/h;
.super Ljava/lang/Object;
.source "CacheableShortcutInfo.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/h$a;
    }
.end annotation


# static fields
.field public static final c:Ls1/h$a;


# instance fields
.field private final a:Landroid/content/pm/ShortcutInfo;

.field private final b:Lcom/android/launcher3/util/k;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ls1/h$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ls1/h$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ls1/h;->c:Ls1/h$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V
    .locals 4

    const-string v0, "info"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "ctx"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    new-instance v0, Lcom/android/launcher3/util/k;

    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getPackage(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getUserHandle()Landroid/os/UserHandle;

    move-result-object v2

    const-string v3, "getUserHandle(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v0, p2, v1, v2}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    invoke-direct {p0, p1, v0}, Ls1/h;-><init>(Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/util/k;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/util/k;)V
    .locals 1

    const-string v0, "shortcutInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "appInfo"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls1/h;->a:Landroid/content/pm/ShortcutInfo;

    iput-object p2, p0, Ls1/h;->b:Lcom/android/launcher3/util/k;

    return-void
.end method

.method public static final a(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/content/pm/ShortcutInfo;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Landroid/content/pm/LauncherActivityInfo;",
            ">;)",
            "Ljava/util/List<",
            "Ls1/h;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ls1/h;->c:Ls1/h$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Ls1/h$a;->a(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static final c(Landroid/content/Context;Landroid/content/pm/ShortcutInfo;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    sget-object v0, Ls1/h;->c:Ls1/h$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1, p2}, Ls1/h$a;->b(Landroid/content/Context;Landroid/content/pm/ShortcutInfo;I)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public final b()Lcom/android/launcher3/util/k;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/h;->b:Lcom/android/launcher3/util/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Landroid/content/pm/ShortcutInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/h;->a:Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    return-object p0
.end method
