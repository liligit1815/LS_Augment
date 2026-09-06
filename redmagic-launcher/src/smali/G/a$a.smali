.class LG/a$a;
.super Ljava/lang/Object;
.source "CallbackWrapper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LG/a;->c(Landroid/graphics/Typeface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LG/g$c;

.field final synthetic h:Landroid/graphics/Typeface;

.field final synthetic i:LG/a;


# direct methods
.method constructor <init>(LG/a;LG/g$c;Landroid/graphics/Typeface;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LG/a$a;->i:LG/a;

    .line 2
    .line 3
    iput-object p2, p0, LG/a$a;->g:LG/g$c;

    .line 4
    .line 5
    iput-object p3, p0, LG/a$a;->h:Landroid/graphics/Typeface;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, LG/a$a;->g:LG/g$c;

    .line 2
    .line 3
    iget-object p0, p0, LG/a$a;->h:Landroid/graphics/Typeface;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, LG/g$c;->b(Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
