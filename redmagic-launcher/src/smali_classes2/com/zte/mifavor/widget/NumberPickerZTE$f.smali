.class Lcom/zte/mifavor/widget/NumberPickerZTE$f;
.super Ljava/lang/Object;
.source "NumberPickerZTE.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/NumberPickerZTE;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "f"
.end annotation


# instance fields
.field private g:Z

.field final synthetic h:Lcom/zte/mifavor/widget/NumberPickerZTE;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/NumberPickerZTE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$f;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/NumberPickerZTE$f;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE$f;->b(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$f;->g:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$f;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$f;->g:Z

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->q(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$f;->h:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->f(Lcom/zte/mifavor/widget/NumberPickerZTE;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-virtual {v0, p0, v1, v2}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method
