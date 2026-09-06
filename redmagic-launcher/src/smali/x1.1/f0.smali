.class public final synthetic Lx1/f0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic g:Lx1/h0;

.field public final synthetic h:Lx1/h0$a;

.field public final synthetic i:Lcom/android/launcher3/C2;


# direct methods
.method public synthetic constructor <init>(Lx1/h0;Lx1/h0$a;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lx1/f0;->g:Lx1/h0;

    .line 5
    .line 6
    iput-object p2, p0, Lx1/f0;->h:Lx1/h0$a;

    .line 7
    .line 8
    iput-object p3, p0, Lx1/f0;->i:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lx1/f0;->g:Lx1/h0;

    .line 2
    .line 3
    iget-object v1, p0, Lx1/f0;->h:Lx1/h0$a;

    .line 4
    .line 5
    iget-object p0, p0, Lx1/f0;->i:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lx1/h0;->a(Lx1/h0;Lx1/h0$a;Lcom/android/launcher3/C2;Landroid/content/DialogInterface;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
