.class public final synthetic Lx1/a0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/C2;

.field public final synthetic h:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/C2;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lx1/a0;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    iput-object p2, p0, Lx1/a0;->h:Landroid/content/Intent;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lx1/a0;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iget-object p0, p0, Lx1/a0;->h:Landroid/content/Intent;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lx1/c0;->b(Lcom/android/launcher3/C2;Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
