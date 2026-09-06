.class public final synthetic LP1/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnDrawListener;


# instance fields
.field public final synthetic g:LP1/h;


# direct methods
.method public synthetic constructor <init>(LP1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LP1/c;->g:LP1/h;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onDraw()V
    .locals 0

    .line 1
    iget-object p0, p0, LP1/c;->g:LP1/h;

    .line 2
    .line 3
    invoke-static {p0}, LP1/h;->c(LP1/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
