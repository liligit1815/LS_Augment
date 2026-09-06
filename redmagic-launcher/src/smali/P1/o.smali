.class public final synthetic LP1/o;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LP1/k$b;

.field public final synthetic h:[Lcom/android/wm/shell/desktopmode/a;

.field public final synthetic i:Z


# direct methods
.method public synthetic constructor <init>(LP1/k$b;[Lcom/android/wm/shell/desktopmode/a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LP1/o;->g:LP1/k$b;

    .line 5
    .line 6
    iput-object p2, p0, LP1/o;->h:[Lcom/android/wm/shell/desktopmode/a;

    .line 7
    .line 8
    iput-boolean p3, p0, LP1/o;->i:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, LP1/o;->g:LP1/k$b;

    .line 2
    .line 3
    iget-object v1, p0, LP1/o;->h:[Lcom/android/wm/shell/desktopmode/a;

    .line 4
    .line 5
    iget-boolean p0, p0, LP1/o;->i:Z

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, LP1/k$b;->u2(LP1/k$b;[Lcom/android/wm/shell/desktopmode/a;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
