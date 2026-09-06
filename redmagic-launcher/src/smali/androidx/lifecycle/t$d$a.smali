.class public final Landroidx/lifecycle/t$d$a;
.super Ljava/lang/Object;
.source "ViewModelProvider.android.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/lifecycle/t$d;
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
    invoke-direct {p0}, Landroidx/lifecycle/t$d$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Landroidx/lifecycle/t$d;
    .locals 0

    .line 1
    invoke-static {}, Landroidx/lifecycle/t$d;->d()Landroidx/lifecycle/t$d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Landroidx/lifecycle/t$d;

    .line 8
    .line 9
    invoke-direct {p0}, Landroidx/lifecycle/t$d;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Landroidx/lifecycle/t$d;->e(Landroidx/lifecycle/t$d;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-static {}, Landroidx/lifecycle/t$d;->d()Landroidx/lifecycle/t$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method
