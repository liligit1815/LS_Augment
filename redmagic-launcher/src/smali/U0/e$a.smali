.class LU0/e$a;
.super Ljava/lang/Object;
.source "IconSurfaceManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LU0/e;->q(Landroid/view/View;I)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:I

.field final synthetic i:LU0/e;


# direct methods
.method constructor <init>(LU0/e;Landroid/view/View;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LU0/e$a;->i:LU0/e;

    .line 2
    .line 3
    iput-object p2, p0, LU0/e$a;->g:Landroid/view/View;

    .line 4
    .line 5
    iput p3, p0, LU0/e$a;->h:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, LU0/e$a;->i:LU0/e;

    .line 2
    .line 3
    iget-object v1, p0, LU0/e$a;->g:Landroid/view/View;

    .line 4
    .line 5
    iget p0, p0, LU0/e$a;->h:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, LU0/e;->r(LU0/e;Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
