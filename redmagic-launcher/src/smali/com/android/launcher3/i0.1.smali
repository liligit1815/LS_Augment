.class public final synthetic Lcom/android/launcher3/i0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/l0;

.field public final synthetic h:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/l0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/i0;->g:Lcom/android/launcher3/l0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/i0;->h:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/i0;->g:Lcom/android/launcher3/l0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/i0;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, Lcom/android/launcher3/l0;->b(Lcom/android/launcher3/l0;Landroid/content/Context;Landroid/content/DialogInterface;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
