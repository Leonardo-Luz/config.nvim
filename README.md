## config.nvim

<pre>
<span class="DashboardHeader">                                                                                     
</span><span class="DashboardHeader">                                                        
</span><span class="DashboardHeader">                                                        
</span><span class="DashboardHeader">                                                        
</span><span class="DashboardHeader">                                                        
</span><span class="DashboardHeader">                                                        
</span><span class="DashboardHeader">                                ██╗     ███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
</span><span class="DashboardHeader">                                ██║     ██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
</span><span class="DashboardHeader">                                ██║     █████╗  ██║   ██║██║   ██║██║██╔████╔██║
</span><span class="DashboardHeader">                                ██║     ██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
</span><span class="DashboardHeader">                                ███████╗███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
</span><span class="DashboardHeader">                                ╚══════╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
</span><span class="DashboardHeader">                                                        
</span><span class="DashboardHeader">                                                    62:03:16
</span><span class="DashboardHeader">                                                        
</span><span class="DashboardHeader">                                                        
</span><span class="-markup-strong">                                              * </span><span class="-markup-strong">Update         <span class="-markup-strong"> [u]</span>
</span>                                                                  
<span class="-markup-strong">                                              * </span><span class="-markup-strong">Edit New File  <span class="-markup-strong"> [e]</span>
</span>                                                                  
<span class="-markup-strong">                                              * </span><span class="-markup-strong">Files          <span class="-markup-strong"> [f]</span>
</span>                                                                  
<span class="-markup-strong">                                              * </span><span class="-markup-strong">Nvim config    <span class="-markup-strong"> [n]</span>
</span>                                                                  
<span class="-markup-strong">                                              * </span><span class="-markup-strong">Telescope      <span class="-markup-strong"> [t]</span>
</span>                                                                  
<span class="DashboardFooter">                                                        
</span><span class="DashboardFooter">                               &quot;Be the change that you wish to see in the world.&quot;
</span><span class="DashboardFooter">                                                           - Mahatma Gandhi
</span><span class="DashboardFooter">                                                        
</span><span class="DashboardFooter">                                                        
</span><span class="DashboardFooter">                                                        
</span><span class="DashboardFooter">                                                        
</span>
</pre>

*Yanked some code from `tjdevries/config.nvim`, `nvim-lua/kickstart.nvim`, and `ThePrimeagen/init.lua`.*

* This configuration is specific to my environment and may receive breaking updates at any time.  Fork this repository or use it with caution.

## Installation

**Steps:**

1. **Fork this Repository**

2. **Clone the Repository:**

   ```bash

   git clone https://github.com/{YOUR-USERNAME}/config.nvim.git ${XDG_CONFIG_HOME:-$HOME/.config}/nvim

   ```

3. **Run Neovim:**

   ```bash

   nvim

   ```

**Alternative Installation:**

* You can keep your existing configuration with this installation method

1. **Fork this Repository**

2. **Clone to `.config/config.nvim`:**

   ```bash

   git clone https://github.com/{YOUR-USERNAME}/config.nvim.git ${XDG_CONFIG_HOME:-$HOME/.config}/config.nvim

   ```

3. **Create an Alias:**

   ```bash

   alias lvim='NVIM_APPNAME=config.nvim nvim'

   ```

4. **Run Neovim using the alias:**

   ```bash

   lvim

   ```
