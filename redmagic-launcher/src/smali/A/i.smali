.class public final synthetic LA/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LA/h$f;

.field public final synthetic h:Landroid/graphics/Typeface;


# direct methods
.method public synthetic constructor <init>(LA/h$f;Landroid/graphics/Typeface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LA/i;->g:LA/h$f;

    .line 5
    .line 6
    iput-object p2, p0, LA/i;->h:Landroid/graphics/Typeface;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LA/i;->g:LA/h$f;

    .line 2
    .line 3
    iget-object p0, p0, LA/i;->h:Landroid/graphics/Typeface;

    .line 4
    .line 5
    invoke-static {v0, p0}, LA/h$f;->a(LA/h$f;Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
