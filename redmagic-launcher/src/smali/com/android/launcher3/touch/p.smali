.class public final synthetic Lcom/android/launcher3/touch/p;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic g:Landroid/content/Context;

.field public final synthetic h:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/touch/p;->g:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/touch/p;->h:Landroid/content/Intent;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/p;->g:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/touch/p;->h:Landroid/content/Intent;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, Lcom/android/launcher3/touch/v;->a(Landroid/content/Context;Landroid/content/Intent;Landroid/content/DialogInterface;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
