.class public final Lu2/F$b$a;
.super Landroid/util/FloatProperty;
.source "TransitionAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lu2/F$b;->d(Lu2/F$h;Lu4/l;)Landroid/util/FloatProperty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "Lu2/F$i;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lu2/F$h;

.field final synthetic b:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Lu2/F$i;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lu2/F$h;Lu4/l;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu2/F$h;",
            "Lu4/l<",
            "-",
            "Lu2/F$i;",
            "Lh4/t;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lu2/F$b$a;->a:Lu2/F$h;

    .line 2
    .line 3
    iput-object p2, p0, Lu2/F$b$a;->b:Lu4/l;

    .line 4
    .line 5
    invoke-direct {p0, p3}, Landroid/util/FloatProperty;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lu2/F$i;)Ljava/lang/Float;
    .locals 1

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lu2/F$b$a;->a:Lu2/F$h;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lu2/F$h;->c(Lu2/F$i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public b(Lu2/F$i;F)V
    .locals 1

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lu2/F$b$a;->a:Lu2/F$h;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Lu2/F$h;->d(Lu2/F$i;F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lu2/F$b$a;->b:Lu4/l;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lu2/F$i;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lu2/F$b$a;->a(Lu2/F$i;)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Lu2/F$i;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lu2/F$b$a;->b(Lu2/F$i;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
