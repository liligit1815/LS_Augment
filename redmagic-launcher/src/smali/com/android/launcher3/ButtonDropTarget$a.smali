.class Lcom/android/launcher3/ButtonDropTarget$a;
.super Ljava/lang/Object;
.source "ButtonDropTarget.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/ButtonDropTarget;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/launcher3/n0$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/n0$a;

.field final synthetic h:Lcom/android/launcher3/ButtonDropTarget;


# direct methods
.method constructor <init>(Lcom/android/launcher3/ButtonDropTarget;Lcom/android/launcher3/n0$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget$a;->h:Lcom/android/launcher3/ButtonDropTarget;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/ButtonDropTarget$a;->g:Lcom/android/launcher3/n0$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/ButtonDropTarget$a;->h:Lcom/android/launcher3/ButtonDropTarget;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget$a;->g:Lcom/android/launcher3/n0$a;

    .line 4
    .line 5
    invoke-virtual {p2, p0}, Lcom/android/launcher3/ButtonDropTarget;->s(Lcom/android/launcher3/n0$a;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
