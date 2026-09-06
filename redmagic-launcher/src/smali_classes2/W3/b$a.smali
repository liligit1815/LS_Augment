.class LW3/b$a;
.super Ljava/lang/Object;
.source "BaseSinkActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LW3/b;->b0(Ljava/lang/String;Ljava/lang/String;ZZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LW3/b;


# direct methods
.method constructor <init>(LW3/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW3/b$a;->g:LW3/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, LW3/b$a;->g:LW3/b;

    .line 2
    .line 3
    invoke-virtual {p0}, LW3/b;->onBackPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
