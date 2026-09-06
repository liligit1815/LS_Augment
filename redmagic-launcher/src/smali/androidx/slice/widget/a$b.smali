.class Landroidx/slice/widget/a$b;
.super Ljava/lang/Object;
.source "ActionRow.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/slice/widget/a;->f(Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/slice/SliceItem;

.field final synthetic h:Landroidx/slice/SliceItem;

.field final synthetic i:Landroidx/slice/widget/a;


# direct methods
.method constructor <init>(Landroidx/slice/widget/a;Landroidx/slice/SliceItem;Landroidx/slice/SliceItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/a$b;->i:Landroidx/slice/widget/a;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/slice/widget/a$b;->g:Landroidx/slice/SliceItem;

    .line 4
    .line 5
    iput-object p3, p0, Landroidx/slice/widget/a$b;->h:Landroidx/slice/SliceItem;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/a$b;->i:Landroidx/slice/widget/a;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/slice/widget/a$b;->g:Landroidx/slice/SliceItem;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/slice/widget/a$b;->h:Landroidx/slice/SliceItem;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/slice/SliceItem;->l()Landroid/app/RemoteInput;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p1, v1, p0}, Landroidx/slice/widget/a;->e(Landroid/view/View;Landroidx/slice/SliceItem;Landroid/app/RemoteInput;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
