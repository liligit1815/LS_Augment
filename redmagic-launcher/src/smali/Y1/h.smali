.class public final LY1/h;
.super Ljava/lang/Object;
.source "TaskbarFeatureEvaluator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LY1/h$a;
    }
.end annotation


# static fields
.field public static final e:LY1/h$a;

.field private static volatile f:LY1/h;


# instance fields
.field private final a:Lcom/android/launcher3/taskbar/I1;

.field private final b:Z

.field private final c:Z

.field private final d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LY1/h$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LY1/h$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LY1/h;->e:LY1/h$a;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LY1/h;->a:Lcom/android/launcher3/taskbar/I1;

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, LY1/h;->b:Z

    .line 4
    iput-boolean v0, p0, LY1/h;->c:Z

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    move-result p1

    iput-boolean p1, p0, LY1/h;->d:Z

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/I1;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LY1/h;-><init>(Lcom/android/launcher3/taskbar/I1;)V

    return-void
.end method

.method public static final synthetic a()LY1/h;
    .locals 1

    .line 1
    sget-object v0, LY1/h;->f:LY1/h;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic b(LY1/h;)V
    .locals 0

    .line 1
    sput-object p0, LY1/h;->f:LY1/h;

    .line 2
    .line 3
    return-void
.end method

.method public static final d(Lcom/android/launcher3/taskbar/I1;)LY1/h;
    .locals 1

    .line 1
    sget-object v0, LY1/h;->e:LY1/h$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, LY1/h$a;->a(Lcom/android/launcher3/taskbar/I1;)LY1/h;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public final c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LY1/h;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LY1/h;->d:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public final f()Z
    .locals 0

    .line 1
    iget-object p0, p0, LY1/h;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 8
    .line 9
    return p0
.end method

.method public final g()Z
    .locals 0

    .line 1
    iget-object p0, p0, LY1/h;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final h()V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    sput-object p0, LY1/h;->f:LY1/h;

    .line 3
    .line 4
    return-void
.end method
