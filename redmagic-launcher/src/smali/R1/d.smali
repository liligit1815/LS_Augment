.class public final synthetic LR1/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LR1/h;

.field public final synthetic h:Lz1/o3;

.field public final synthetic i:LR1/i;

.field public final synthetic j:Landroid/content/pm/PackageManager;

.field public final synthetic k:Lcom/android/launcher3/widget/l0;


# direct methods
.method public synthetic constructor <init>(LR1/h;Lz1/o3;LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LR1/d;->g:LR1/h;

    .line 5
    .line 6
    iput-object p2, p0, LR1/d;->h:Lz1/o3;

    .line 7
    .line 8
    iput-object p3, p0, LR1/d;->i:LR1/i;

    .line 9
    .line 10
    iput-object p4, p0, LR1/d;->j:Landroid/content/pm/PackageManager;

    .line 11
    .line 12
    iput-object p5, p0, LR1/d;->k:Lcom/android/launcher3/widget/l0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, LR1/d;->g:LR1/h;

    .line 2
    .line 3
    iget-object v1, p0, LR1/d;->h:Lz1/o3;

    .line 4
    .line 5
    iget-object v2, p0, LR1/d;->i:LR1/i;

    .line 6
    .line 7
    iget-object v3, p0, LR1/d;->j:Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    iget-object p0, p0, LR1/d;->k:Lcom/android/launcher3/widget/l0;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, LR1/h;->b(LR1/h;Lz1/o3;LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
