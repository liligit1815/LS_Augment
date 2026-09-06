.class public final LX1/a;
.super Ljava/lang/Object;
.source "BubbleBarLocationOnDemandListener.kt"

# interfaces
.implements Lcom/android/launcher3/taskbar/bubbles/t$a;


# instance fields
.field private final g:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Lcom/android/launcher3/taskbar/bubbles/t$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lu4/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "+",
            "Lcom/android/launcher3/taskbar/bubbles/t$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "listenerProvider"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LX1/a;->g:Lu4/a;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b(LN2/h;)V
    .locals 1

    .line 1
    const-string v0, "location"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LX1/a;->g:Lu4/a;

    .line 7
    .line 8
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/t$a;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t$a;->b(LN2/h;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public c(LN2/h;)V
    .locals 1

    .line 1
    const-string v0, "location"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LX1/a;->g:Lu4/a;

    .line 7
    .line 8
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/android/launcher3/taskbar/bubbles/t$a;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Lcom/android/launcher3/taskbar/bubbles/t$a;->c(LN2/h;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
