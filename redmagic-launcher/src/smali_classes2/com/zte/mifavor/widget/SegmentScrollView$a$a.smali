.class Lcom/zte/mifavor/widget/SegmentScrollView$a$a;
.super Ljava/lang/Object;
.source "SegmentScrollView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/SegmentScrollView$a;->onGlobalLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/SegmentScrollView$a;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/SegmentScrollView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->b(Lcom/zte/mifavor/widget/SegmentScrollView;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView$a;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->d(Lcom/zte/mifavor/widget/SegmentScrollView;)Lcom/zte/mifavor/widget/SegmentSelector;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView$a;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->d(Lcom/zte/mifavor/widget/SegmentScrollView;)Lcom/zte/mifavor/widget/SegmentSelector;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/SegmentSelector;->getSelectedPosition()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/SegmentScrollView;->j(Lcom/zte/mifavor/widget/SegmentScrollView;I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView$a;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$a;->g:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/zte/mifavor/widget/SegmentScrollView;->i(Lcom/zte/mifavor/widget/SegmentScrollView;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
