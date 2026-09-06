.class public final synthetic LO0/q;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>(ZLandroid/view/View;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, LO0/q;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, LO0/q;->b:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, LO0/q;->c:Ljava/util/function/Consumer;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, LO0/q;->a:Z

    .line 2
    .line 3
    iget-object v1, p0, LO0/q;->b:Landroid/view/View;

    .line 4
    .line 5
    iget-object p0, p0, LO0/q;->c:Ljava/util/function/Consumer;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, LO0/r;->t(ZLandroid/view/View;Ljava/util/function/Consumer;Ljava/lang/Boolean;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
