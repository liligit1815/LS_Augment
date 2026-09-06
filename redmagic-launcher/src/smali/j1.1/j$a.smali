.class public final Lj1/j$a;
.super Ljava/lang/Object;
.source "DesktopAppLaunchTransitionManager.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lj1/j;
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
    invoke-direct {p0}, Lj1/j$a;-><init>()V

    return-void
.end method

.method public static final synthetic a(Lj1/j$a;)Landroid/window/TransitionFilter;
    .locals 0

    .line 1
    invoke-direct {p0}, Lj1/j$a;->b()Landroid/window/TransitionFilter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final b()Landroid/window/TransitionFilter;
    .locals 3

    .line 1
    new-instance p0, Landroid/window/TransitionFilter$Requirement;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/window/TransitionFilter$Requirement;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput v0, p0, Landroid/window/TransitionFilter$Requirement;->mActivityType:I

    .line 8
    .line 9
    const/4 v1, 0x5

    .line 10
    iput v1, p0, Landroid/window/TransitionFilter$Requirement;->mWindowingMode:I

    .line 11
    .line 12
    sget-object v1, Lj1/i;->k:Lj1/i$b;

    .line 13
    .line 14
    invoke-virtual {v1}, Lj1/i$b;->a()[I

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iput-object v2, p0, Landroid/window/TransitionFilter$Requirement;->mModes:[I

    .line 19
    .line 20
    iput-boolean v0, p0, Landroid/window/TransitionFilter$Requirement;->mMustBeTask:Z

    .line 21
    .line 22
    iput v0, p0, Landroid/window/TransitionFilter$Requirement;->mOrder:I

    .line 23
    .line 24
    new-instance v0, Landroid/window/TransitionFilter;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/window/TransitionFilter;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Lj1/i$b;->a()[I

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Landroid/window/TransitionFilter;->mTypeSet:[I

    .line 34
    .line 35
    filled-new-array {p0}, [Landroid/window/TransitionFilter$Requirement;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iput-object p0, v0, Landroid/window/TransitionFilter;->mRequirements:[Landroid/window/TransitionFilter$Requirement;

    .line 40
    .line 41
    return-object v0
.end method
