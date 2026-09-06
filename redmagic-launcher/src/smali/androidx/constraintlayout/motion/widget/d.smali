.class public abstract Landroidx/constraintlayout/motion/widget/d;
.super Ljava/lang/Object;
.source "Key.java"


# static fields
.field public static f:I = -0x1


# instance fields
.field a:I

.field b:I

.field c:Ljava/lang/String;

.field protected d:I

.field e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroidx/constraintlayout/widget/a;",
            ">;"
        }
    .end annotation
.end field


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
    sget v0, Landroidx/constraintlayout/motion/widget/d;->f:I

    .line 5
    .line 6
    iput v0, p0, Landroidx/constraintlayout/motion/widget/d;->a:I

    .line 7
    .line 8
    iput v0, p0, Landroidx/constraintlayout/motion/widget/d;->b:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/d;->c:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public abstract a(Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lv/c;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract b()Landroidx/constraintlayout/motion/widget/d;
.end method

.method public c(Landroidx/constraintlayout/motion/widget/d;)Landroidx/constraintlayout/motion/widget/d;
    .locals 1

    .line 1
    iget v0, p1, Landroidx/constraintlayout/motion/widget/d;->a:I

    .line 2
    .line 3
    iput v0, p0, Landroidx/constraintlayout/motion/widget/d;->a:I

    .line 4
    .line 5
    iget v0, p1, Landroidx/constraintlayout/motion/widget/d;->b:I

    .line 6
    .line 7
    iput v0, p0, Landroidx/constraintlayout/motion/widget/d;->b:I

    .line 8
    .line 9
    iget-object v0, p1, Landroidx/constraintlayout/motion/widget/d;->c:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/d;->c:Ljava/lang/String;

    .line 12
    .line 13
    iget v0, p1, Landroidx/constraintlayout/motion/widget/d;->d:I

    .line 14
    .line 15
    iput v0, p0, Landroidx/constraintlayout/motion/widget/d;->d:I

    .line 16
    .line 17
    iget-object p1, p1, Landroidx/constraintlayout/motion/widget/d;->e:Ljava/util/HashMap;

    .line 18
    .line 19
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/d;->e:Ljava/util/HashMap;

    .line 20
    .line 21
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/d;->b()Landroidx/constraintlayout/motion/widget/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method abstract d(Ljava/util/HashSet;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method abstract e(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end method

.method public f(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public g(I)Landroidx/constraintlayout/motion/widget/d;
    .locals 0

    .line 1
    iput p1, p0, Landroidx/constraintlayout/motion/widget/d;->b:I

    .line 2
    .line 3
    return-object p0
.end method
