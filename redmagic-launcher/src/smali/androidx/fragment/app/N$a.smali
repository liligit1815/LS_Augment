.class final Landroidx/fragment/app/N$a;
.super Ljava/lang/Object;
.source "FragmentTransaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/N;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# instance fields
.field a:I

.field b:Landroidx/fragment/app/n;

.field c:Z

.field d:I

.field e:I

.field f:I

.field g:I

.field h:Landroidx/lifecycle/g$b;

.field i:Landroidx/lifecycle/g$b;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(ILandroidx/fragment/app/n;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput p1, p0, Landroidx/fragment/app/N$a;->a:I

    .line 4
    iput-object p2, p0, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Landroidx/fragment/app/N$a;->c:Z

    .line 6
    sget-object p1, Landroidx/lifecycle/g$b;->k:Landroidx/lifecycle/g$b;

    iput-object p1, p0, Landroidx/fragment/app/N$a;->h:Landroidx/lifecycle/g$b;

    .line 7
    iput-object p1, p0, Landroidx/fragment/app/N$a;->i:Landroidx/lifecycle/g$b;

    return-void
.end method

.method constructor <init>(ILandroidx/fragment/app/n;Z)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput p1, p0, Landroidx/fragment/app/N$a;->a:I

    .line 10
    iput-object p2, p0, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 11
    iput-boolean p3, p0, Landroidx/fragment/app/N$a;->c:Z

    .line 12
    sget-object p1, Landroidx/lifecycle/g$b;->k:Landroidx/lifecycle/g$b;

    iput-object p1, p0, Landroidx/fragment/app/N$a;->h:Landroidx/lifecycle/g$b;

    .line 13
    iput-object p1, p0, Landroidx/fragment/app/N$a;->i:Landroidx/lifecycle/g$b;

    return-void
.end method
