.class Lv/b$b;
.super Lv/b;
.source "ViewOscillator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation


# instance fields
.field h:[F

.field protected i:Landroidx/constraintlayout/widget/a;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lv/b;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    iput-object v0, p0, Lv/b$b;->h:[F

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method protected b(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroidx/constraintlayout/widget/a;

    .line 2
    .line 3
    iput-object p1, p0, Lv/b$b;->i:Landroidx/constraintlayout/widget/a;

    .line 4
    .line 5
    return-void
.end method

.method public i(Landroid/view/View;F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/b$b;->h:[F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, p2}, Lr/e;->a(F)F

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    aput p2, v0, v1

    .line 9
    .line 10
    iget-object p2, p0, Lv/b$b;->i:Landroidx/constraintlayout/widget/a;

    .line 11
    .line 12
    iget-object p0, p0, Lv/b$b;->h:[F

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Lv/a;->b(Landroidx/constraintlayout/widget/a;Landroid/view/View;[F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
