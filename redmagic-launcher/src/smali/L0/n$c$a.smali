.class LL0/n$c$a;
.super Ljava/lang/Object;
.source "ViewCapture.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LL0/n$c;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LL0/n$c;


# direct methods
.method constructor <init>(LL0/n$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, LL0/n$c$a;->g:LL0/n$c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, LL0/n$c$a;->g:LL0/n$c;

    .line 2
    .line 3
    invoke-static {p1}, LL0/n$c;->e(LL0/n$c;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, LL0/n$c$a;->g:LL0/n$c;

    .line 10
    .line 11
    invoke-static {p1}, LL0/n$c;->g(LL0/n$c;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, LL0/n$c$a;->g:LL0/n$c;

    .line 15
    .line 16
    iget-object p1, p1, LL0/n$c;->g:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method
