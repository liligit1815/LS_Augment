.class public final synthetic LY0/e;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ljava/io/InputStream;

.field public final synthetic h:Landroid/content/Context;

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Z

.field public final synthetic l:Z


# direct methods
.method public synthetic constructor <init>(Ljava/io/InputStream;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LY0/e;->g:Ljava/io/InputStream;

    .line 5
    .line 6
    iput-object p2, p0, LY0/e;->h:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, LY0/e;->i:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, LY0/e;->j:Ljava/lang/String;

    .line 11
    .line 12
    iput-boolean p5, p0, LY0/e;->k:Z

    .line 13
    .line 14
    iput-boolean p6, p0, LY0/e;->l:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, LY0/e;->g:Ljava/io/InputStream;

    .line 2
    .line 3
    iget-object v1, p0, LY0/e;->h:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, LY0/e;->i:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, LY0/e;->j:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean v4, p0, LY0/e;->k:Z

    .line 10
    .line 11
    iget-boolean v5, p0, LY0/e;->l:Z

    .line 12
    .line 13
    invoke-static/range {v0 .. v5}, LY0/f;->b(Ljava/io/InputStream;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
