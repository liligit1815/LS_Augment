.class Lcom/zte/mifavor/widget/ListView$c;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/ListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/ListView;


# direct methods
.method private constructor <init>(Lcom/zte/mifavor/widget/ListView;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/zte/mifavor/widget/ListView$c;->g:Lcom/zte/mifavor/widget/ListView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/zte/mifavor/widget/ListView;Lcom/zte/mifavor/widget/l;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/ListView$c;-><init>(Lcom/zte/mifavor/widget/ListView;)V

    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$c;->g:Lcom/zte/mifavor/widget/ListView;

    .line 2
    .line 3
    const/4 p2, -0x1

    .line 4
    invoke-virtual {p1, p2}, Landroid/widget/ListView;->canScrollVertically(I)Z

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$c;->g:Lcom/zte/mifavor/widget/ListView;

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    invoke-virtual {p1, p2}, Landroid/widget/ListView;->canScrollVertically(I)Z

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$c;->g:Lcom/zte/mifavor/widget/ListView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/zte/mifavor/widget/ListView;->getIsBeingDragged()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$c;->g:Lcom/zte/mifavor/widget/ListView;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/zte/mifavor/widget/ListView;->a(Lcom/zte/mifavor/widget/ListView;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/zte/mifavor/widget/ListView$c;->g:Lcom/zte/mifavor/widget/ListView;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/zte/mifavor/widget/ListView;->b(Lcom/zte/mifavor/widget/ListView;)Lb4/e;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Lcom/zte/mifavor/widget/ListView$c;->g:Lcom/zte/mifavor/widget/ListView;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/zte/mifavor/widget/ListView;->b(Lcom/zte/mifavor/widget/ListView;)Lb4/e;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    neg-float p1, p4

    .line 44
    float-to-int p1, p1

    .line 45
    invoke-virtual {p0, p1}, Lb4/e;->h(I)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return p2

    .line 49
    :cond_1
    const/4 p0, 0x0

    .line 50
    return p0
.end method
