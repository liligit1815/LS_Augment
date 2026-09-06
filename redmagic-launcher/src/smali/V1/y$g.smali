.class public final LV1/y$g;
.super Ly/e;
.source "BubbleBarViewAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LV1/y;->y0(Ly/s;Lu4/a;)Ly/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic a:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lu4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LV1/y$g;->a:Lu4/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ly/e;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c(Ly/d;)V
    .locals 1

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LV1/y$g;->a:Lu4/a;

    .line 7
    .line 8
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method
