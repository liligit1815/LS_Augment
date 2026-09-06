.class Lcom/zte/mifavor/androidx/widget/RecyclerView$f;
.super Ljava/lang/Object;
.source "RecyclerView.java"

# interfaces
.implements LX3/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/androidx/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "f"
.end annotation


# instance fields
.field private a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

.field private b:LX3/d;


# direct methods
.method public constructor <init>(Lcom/zte/mifavor/androidx/widget/RecyclerView;LX3/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$f;->a:Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$f;->b:LX3/d;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;LX3/e;I)V
    .locals 0

    .line 1
    if-ltz p3, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/mifavor/androidx/widget/RecyclerView$f;->b:LX3/d;

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, LX3/d;->a(Landroid/view/View;LX3/e;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
